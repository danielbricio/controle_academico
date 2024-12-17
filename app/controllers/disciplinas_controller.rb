class DisciplinasController < ApplicationController
  # Ação index: lista todas as disciplinas com paginação
  def index
    # Paginação de 5 registros por página
    @disciplinas = Disciplina.page(params[:page]).per(5)
    # @disciplinas armazena o resultado da consulta paginada para ser utilizado na view
  end

  # Ação show: exibe os detalhes de uma disciplina específica
  def show
    # Busca uma disciplina pelo ID passado como parâmetro na URL
    @disciplina = Disciplina.find(params[:id])
  end

  # Ação new: exibe o formulário para criar uma nova disciplina
  def new
    # Inicializa um novo objeto do modelo Disciplina
    @disciplina = Disciplina.new
  end

  # Ação create: cria uma nova disciplina no banco de dados
  def create
    # Cria uma nova instância de Disciplina com os parâmetros fornecidos pelo formulário
    @disciplina = Disciplina.new(disciplina_params)
    
    # Tenta salvar o registro no banco de dados
    if @disciplina.save
      # Redireciona para a lista de disciplinas com mensagem de sucesso
      redirect_to disciplinas_path, notice: "Disciplina criada com sucesso!"
    else
      # Caso falhe, renderiza novamente o formulário com os erros
      render :new
    end
  end

  # Ação edit: exibe o formulário para editar uma disciplina existente
  def edit
    # Busca a disciplina pelo ID passado como parâmetro na URL
    @disciplina = Disciplina.find(params[:id])
  end

  # Ação update: atualiza os dados de uma disciplina existente
  def update
    # Busca a disciplina pelo ID
    @disciplina = Disciplina.find(params[:id])
    
    # Tenta atualizar o registro com os novos dados
    if @disciplina.update(disciplina_params)
      # Redireciona para a lista de disciplinas com mensagem de sucesso
      redirect_to disciplinas_path, notice: "Disciplina atualizada com sucesso!"
    else
      # Caso falhe, renderiza novamente o formulário com os erros
      render :edit
    end
  end

  # Ação destroy: exclui uma disciplina do banco de dados
  def destroy
    # Busca a disciplina pelo ID
    @disciplina = Disciplina.find(params[:id])
    
    # Exclui o registro do banco
    @disciplina.destroy
    
    # Redireciona para a lista de disciplinas com mensagem de sucesso
    redirect_to disciplinas_path, notice: "Disciplina excluída com sucesso!"
  end

  private

  # Método privado: define os parâmetros permitidos para o modelo Disciplina
  def disciplina_params
    # Garante que apenas os atributos :nome e :codigo podem ser enviados no formulário
    params.require(:disciplina).permit(:nome, :codigo)
  end
end
