class AddSaltToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :salt, :string

  end
end
