class AddTipoToPublicacao < ActiveRecord::Migration
  def change
    add_column :publicacaos, :tipo, :string

  end
end
