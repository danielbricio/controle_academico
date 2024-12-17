class MatriculasController < ApplicationController
  # Executa o método `set_matricula` antes das ações :show, :edit, :update, :destroy
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]

  # Ação para listar todas as matrículas com paginação
  def index
    # Busca todas as matrículas com 5 registros por página
    @matriculas = Matricula.page(params[:page]).per(5)
  end

  # Ação para mostrar os detalhes de uma matrícula específica
  def show
    # A matrícula já é definida pelo `before_action` (set_matricula)
  end

  # Ação para exibir o formulário de criação de uma nova matrícula
  def new
    # Cria uma nova instância de matrícula vazia
    @matricula = Matricula.new
  end

  # Ação para criar e salvar uma nova matrícula
  def create
    # Inicializa uma nova matrícula com os parâmetros fornecidos
    @matricula = Matricula.new(matricula_params)

    # Tenta salvar a matrícula no banco de dados
    if @matricula.save
      # Redireciona para a lista de matrículas com mensagem de sucesso
      redirect_to matriculas_path, notice: "Matrícula criada com sucesso!"
    else
      # Renderiza novamente o formulário caso ocorra erro
      render :new
    end
  end

  # Ação para exibir o formulário de edição de uma matrícula existente
  def edit
    # A matrícula já é definida pelo `before_action` (set_matricula)
  end

  # Ação para atualizar uma matrícula existente
  def update
    # Tenta atualizar a matrícula com os parâmetros fornecidos
    if @matricula.update(matricula_params)
      # Redireciona para a lista de matrículas com mensagem de sucesso
      redirect_to matriculas_path, notice: "Matrícula atualizada com sucesso!"
    else
      # Renderiza novamente o formulário caso ocorra erro
      render :edit
    end
  end

  # Ação para excluir uma matrícula existente
  def destroy
    # Exclui a matrícula encontrada pelo `before_action`
    @matricula.destroy
    # Redireciona para a lista de matrículas com mensagem de sucesso
    redirect_to matriculas_path, notice: "Matrícula excluída com sucesso!"
  end

  private

  # Método privado para localizar uma matrícula pelo ID
  def set_matricula
    # Busca a matrícula com base no parâmetro `id` fornecido na URL
    @matricula = Matricula.find(params[:id])
  end

  # Método privado para definir os parâmetros permitidos
  def matricula_params
    # Permite apenas os parâmetros necessários: aluno_id, disciplina_id e foto
    params.require(:matricula).permit(:aluno_id, :disciplina_id, :foto)
  end
end
