require 'csv'

class AlunosController < ApplicationController

  # Ação para exportar um CSV combinado
  def exportar_csv
    # Dados das tabelas
    @alunos = Aluno.all
    @disciplinas = Disciplina.all
    @matriculas = Matricula.includes(:aluno, :disciplina) # Carrega relações

    # Gera o CSV
    csv_data = CSV.generate(headers: true) do |csv|
      # Cabeçalhos principais
      csv << ["Tabela", "ID", "Nome/Aluno", "Idade", "Email", "Código/Disciplina", "Matrícula"]

      # Adiciona os dados de Alunos
      @alunos.each do |aluno|
        csv << ["Alunos", aluno.id, aluno.nome, aluno.idade, aluno.email, "", ""]
      end

      # Adiciona os dados de Disciplinas
      @disciplinas.each do |disciplina|
        csv << ["Disciplinas", disciplina.id, "", "", "", disciplina.nome, disciplina.codigo]
      end

      # Adiciona os dados de Matrículas
      @matriculas.each do |matricula|
        csv << ["Matrículas", matricula.id, matricula.aluno.nome, matricula.aluno.idade,
                matricula.aluno.email, matricula.disciplina.nome, matricula.disciplina.codigo]
      end
    end

    # Envia o arquivo CSV
    send_data csv_data, filename: "dados-completos-#{Date.today}.csv"
  end

  
  # Listar todos os alunos com paginação
  def index
    @alunos = Aluno.page(params[:page]).per(5) # 5 registros por página
    
    # Exportar para PDF
    # Exportar para PDF
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Lista de Alunos", size: 20, style: :bold, align: :center
        pdf.move_down 10

        # Carrega todos os alunos, ignorando a paginação
        alunos = Aluno.all

        table_data = [["Nome", "Idade", "Email"]]
        alunos.each do |aluno|
          table_data << [aluno.nome, aluno.idade, aluno.email]
        end

        pdf.table(table_data, header: true, cell_style: { border_width: 0.5, padding: 5 })
        send_data pdf.render, filename: "alunos.pdf", type: "application/pdf", disposition: "inline"
      end
    end

  end

  # Mostrar um aluno específico
  def show
    @aluno = Aluno.find(params[:id])
  end

  # Formulário para criar um novo aluno
  def new
    @aluno = Aluno.new
  end

  # Criar um novo aluno
  def create
    @aluno = Aluno.new(aluno_params)
    if @aluno.save
      redirect_to alunos_path, notice: "Aluno criado com sucesso!"
    else
      render :new
    end
  end

  # Formulário para editar um aluno existente
  def edit
    @aluno = Aluno.find(params[:id])
  end

  # Atualizar um aluno existente
  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update(aluno_params)
      redirect_to alunos_path, notice: "Aluno atualizado com sucesso!"
    else
      render :edit
    end
  end

  # Excluir um aluno
  def destroy
    @aluno = Aluno.find(params[:id])
    @aluno.destroy
    redirect_to alunos_path, notice: "Aluno excluído com sucesso!"
  end

  private

  # Definir os parâmetros permitidos
  def aluno_params
    params.require(:aluno).permit(:nome, :idade, :email)
  end



end


