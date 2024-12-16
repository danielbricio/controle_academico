class CreateDisciplinas < ActiveRecord::Migration[6.1]
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :codigo

      t.timestamps
    end
  end
end