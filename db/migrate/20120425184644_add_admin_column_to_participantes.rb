class AddAdminColumnToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :admin, :string

  end
end
