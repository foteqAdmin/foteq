class AddPermissionColumnToParticipantes < ActiveRecord::Migration
  def change
    add_column :participantes, :permission, :string

  end
end
