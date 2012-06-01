class CreatePublicacaos < ActiveRecord::Migration
  def change
    create_table :publicacaos do |t|
      t.text :participantes
      t.text :titulo
      t.integer :ano
      t.string :suporte
      t.integer :volume
      t.integer :pag_ini
      t.integer :pag_final
      t.string :arquivo

      t.timestamps
    end
  end
end
