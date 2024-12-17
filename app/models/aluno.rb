class Aluno < ApplicationRecord
  # Associação: Um aluno pode ter várias matrículas.
  # Se o aluno for excluído, todas as matrículas associadas também serão destruídas.
  has_many :matriculas, dependent: :destroy

  # Associação: Um aluno pode estar matriculado em várias disciplinas
  # através do relacionamento com as matrículas.
  has_many :disciplinas, through: :matriculas
end
