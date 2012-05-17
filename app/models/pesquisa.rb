class Pesquisa < ActiveRecord::Base
  has_many :participantes

  validates :nome, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :descricao, :presence => true
  validates :participantes, :presence => true
end
