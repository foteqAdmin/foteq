class CreateStatusSheets < ActiveRecord::Migration
  def change
    create_table :status_sheets do |t|
      t.integer :participante_id
      t.date :data_ini
      t.date :data_final
      t.text :status
      t.integer :projeto_id

      t.timestamps
    end
  end
end
