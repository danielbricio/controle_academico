class Disciplina < ApplicationRecord
  # Relacionamento de um para muitos com o modelo 'Matricula'
  # Uma disciplina pode ter várias matrículas
  has_many :matriculas, dependent: :destroy

  # Relacionamento muitos para muitos com o modelo 'Aluno'
  # Uma disciplina pode estar associada a vários alunos por meio de matrículas
  has_many :alunos, through: :matriculas
end