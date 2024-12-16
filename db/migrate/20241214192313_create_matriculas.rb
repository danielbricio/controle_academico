class CreateMatriculas < ActiveRecord::Migration[6.1]
  def change
    create_table :matriculas do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
