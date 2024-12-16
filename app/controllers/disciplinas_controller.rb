class DisciplinasController < ApplicationController
  # Listar todas as disciplinas com paginação
  def index
    @disciplinas = Disciplina.page(params[:page]).per(5) # 5 registros por página
  end

  # Mostrar uma disciplina específica
  def show
    @disciplina = Disciplina.find(params[:id])
  end

  # Formulário para criar nova disciplina
  def new
    @disciplina = Disciplina.new
  end

  # Criar nova disciplina
  def create
    @disciplina = Disciplina.new(disciplina_params)
    if @disciplina.save
      redirect_to disciplinas_path, notice: "Disciplina criada com sucesso!"
    else
      render :new
    end
  end

  # Formulário para editar disciplina existente
  def edit
    @disciplina = Disciplina.find(params[:id])
  end

  # Atualizar uma disciplina existente
  def update
    @disciplina = Disciplina.find(params[:id])
    if @disciplina.update(disciplina_params)
      redirect_to disciplinas_path, notice: "Disciplina atualizada com sucesso!"
    else
      render :edit
    end
  end

  # Excluir uma disciplina
  def destroy
    @disciplina = Disciplina.find(params[:id])
    @disciplina.destroy
    redirect_to disciplinas_path, notice: "Disciplina excluída com sucesso!"
  end

  private

  # Parâmetros permitidos
  def disciplina_params
    params.require(:disciplina).permit(:nome, :codigo)
  end
end
