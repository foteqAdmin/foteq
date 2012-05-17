class CreatePesquisas < ActiveRecord::Migration
  def change
    create_table :pesquisas do |t|
      t.string :nome
      t.text :descricao
      t.text :participantes
      t.text :financiadores

      t.timestamps
    end
  end
end
