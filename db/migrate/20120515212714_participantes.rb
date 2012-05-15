class Participantes < ActiveRecord::Migration
  def change
    change_column(:participantes, :descricao, :text)
  end
end
