class CreateAlunos < ActiveRecord::Migration[6.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.integer :idade
      t.string :email

      t.timestamps
    end
  end
end