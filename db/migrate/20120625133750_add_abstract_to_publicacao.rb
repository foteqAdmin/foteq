class AddAbstractToPublicacao < ActiveRecord::Migration
  def change
    add_column :publicacaos, :abstract, :text

  end
end
