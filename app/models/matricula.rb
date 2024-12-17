class Matricula < ApplicationRecord
  # Associação muitos-para-um: cada matrícula pertence a um aluno
  belongs_to :aluno

  # Associação muitos-para-um: cada matrícula pertence a uma disciplina
  belongs_to :disciplina

  # Associação com Active Storage: permite anexar um arquivo de imagem (foto) à matrícula
  has_one_attached :foto
end
