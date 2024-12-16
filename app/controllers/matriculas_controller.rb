class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]

  # Listar todas as matrículas com paginação
  def index
    @matriculas = Matricula.page(params[:page]).per(2) # 5 registros por página
  end

  # Mostrar detalhes de uma matrícula
  def show
  end

  # Formulário para criar uma nova matrícula
  def new
    @matricula = Matricula.new
  end

  # Criar nova matrícula
  def create
    @matricula = Matricula.new(matricula_params)
    if @matricula.save
      redirect_to matriculas_path, notice: "Matrícula criada com sucesso!"
    else
      render :new
    end
  end

  # Formulário para editar uma matrícula existente
  def edit
  end

  # Atualizar uma matrícula existente
  def update
    if @matricula.update(matricula_params)
      redirect_to matriculas_path, notice: "Matrícula atualizada com sucesso!"
    else
      render :edit
    end
  end

  # Excluir uma matrícula
  def destroy
    @matricula.destroy
    redirect_to matriculas_path, notice: "Matrícula excluída com sucesso!"
  end

  private

  # Localizar matrícula pelo ID
  def set_matricula
    @matricula = Matricula.find(params[:id])
  end

  # Definir os parâmetros permitidos
  def matricula_params
    params.require(:matricula).permit(:aluno_id, :disciplina_id, :foto)
  end
end
