require 'csv' # Biblioteca padrão do Ruby para manipulação de arquivos CSV

class AlunosController < ApplicationController

  # Ação para exportar um CSV combinado contendo Alunos, Disciplinas e Matrículas
  def exportar_csv
    # Busca todos os registros necessários
    @alunos = Aluno.all # Obtém todos os registros da tabela Aluno
    @disciplinas = Disciplina.all # Obtém todos os registros da tabela Disciplina
    @matriculas = Matricula.includes(:aluno, :disciplina) # Carrega as relações entre Matrícula, Aluno e Disciplina

    # Gera o conteúdo do CSV com cabeçalhos
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Tabela", "ID", "Nome/Aluno", "Idade", "Email", "Código/Disciplina", "Matrícula"]

      # Dados da tabela Aluno
      @alunos.each do |aluno|
        csv << ["Alunos", aluno.id, aluno.nome, aluno.idade, aluno.email, "", ""]
      end

      # Dados da tabela Disciplina
      @disciplinas.each do |disciplina|
        csv << ["Disciplinas", disciplina.id, "", "", "", disciplina.nome, disciplina.codigo]
      end

      # Dados da tabela Matrícula (com informações relacionadas de Aluno e Disciplina)
      @matriculas.each do |matricula|
        csv << ["Matrículas", matricula.id, matricula.aluno.nome, matricula.aluno.idade,
                matricula.aluno.email, matricula.disciplina.nome, matricula.disciplina.codigo]
      end
    end

    # Envia o arquivo CSV como resposta para download no navegador
    send_data csv_data, filename: "dados-completos-#{Date.today}.csv"
  end

  # Ação index: lista todos os alunos com paginação e exportação para PDF
  def index
    # Paginação: busca 5 registros por página
    @alunos = Aluno.page(params[:page]).per(5)

    # Responde em diferentes formatos: HTML (padrão) e PDF
    respond_to do |format|
      format.html # Renderiza o formato padrão HTML
      format.pdf do
        pdf = Prawn::Document.new # Cria um novo documento PDF
        pdf.text "Lista de Alunos", size: 20, style: :bold, align: :center # Adiciona título no PDF
        pdf.move_down 10 # Adiciona espaço entre título e tabela

        # Carrega todos os alunos para exibição no PDF
        alunos = Aluno.all

        # Estrutura de dados para a tabela do PDF
        table_data = [["Nome", "Idade", "Email"]]
        alunos.each do |aluno|
          table_data << [aluno.nome, aluno.idade, aluno.email]
        end

        # Cria uma tabela no PDF
        pdf.table(table_data, header: true, cell_style: { border_width: 0.5, padding: 5 })

        # Envia o PDF gerado ao navegador
        send_data pdf.render, filename: "alunos.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # Ação show: exibe um aluno específico
  def show
    @aluno = Aluno.find(params[:id]) # Busca o aluno pelo ID fornecido na URL
  end

  # Ação new: inicializa um novo objeto Aluno para o formulário
  def new
    @aluno = Aluno.new # Instância vazia do modelo Aluno
  end

  # Ação create: cria um novo aluno a partir dos parâmetros do formulário
  def create
    @aluno = Aluno.new(aluno_params) # Instancia um novo Aluno com os parâmetros permitidos
    if @aluno.save
      # Redireciona para a lista de alunos se o registro for salvo com sucesso
      redirect_to alunos_path, notice: "Aluno criado com sucesso!"
    else
      render :new # Volta ao formulário em caso de erro
    end
  end

  # Ação edit: busca o aluno específico para edição
  def edit
    @aluno = Aluno.find(params[:id]) # Busca o aluno pelo ID
  end

  # Ação update: atualiza um aluno existente com novos valores
  def update
    @aluno = Aluno.find(params[:id]) # Busca o aluno pelo ID
    if @aluno.update(aluno_params)
      # Redireciona para a lista de alunos em caso de sucesso
      redirect_to alunos_path, notice: "Aluno atualizado com sucesso!"
    else
      render :edit # Volta ao formulário em caso de erro
    end
  end

  # Ação destroy: exclui um aluno específico
  def destroy
    @aluno = Aluno.find(params[:id]) # Busca o aluno pelo ID
    @aluno.destroy # Exclui o registro do banco de dados
    redirect_to alunos_path, notice: "Aluno excluído com sucesso!" # Redireciona com mensagem
  end

  private

  # Método privado: define os parâmetros permitidos para Aluno
  def aluno_params
    params.require(:aluno).permit(:nome, :idade, :email)
  end

end
