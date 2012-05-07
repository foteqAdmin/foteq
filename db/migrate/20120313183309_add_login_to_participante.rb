class AddLoginToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :login, :string

  end
end
