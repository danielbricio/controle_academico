class Aluno < ApplicationRecord
  has_many :matriculas, dependent: :destroy
  has_many :disciplinas, through: :matriculas
end