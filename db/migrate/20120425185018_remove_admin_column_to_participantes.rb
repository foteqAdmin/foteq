class RemoveAdminColumnToParticipantes < ActiveRecord::Migration
  def up
    remove_column :participantes, :admin
      end

  def down
    add_column :participantes, :admin, :string
  end
end
