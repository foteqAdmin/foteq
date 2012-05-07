class AddPasswordToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :password, :string

  end
end
