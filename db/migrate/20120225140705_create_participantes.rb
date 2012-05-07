class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.string :nome
      t.string :email
      t.string :projeto
      t.string :foto_url
      t.string :descricao
      t.string :lattes

      t.timestamps
    end
  end
end
