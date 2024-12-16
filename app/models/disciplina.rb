class Disciplina < ApplicationRecord
  has_many :matriculas, dependent: :destroy
  has_many :alunos, through: :matriculas
end