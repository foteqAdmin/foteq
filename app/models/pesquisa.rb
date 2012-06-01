class Pesquisa < ActiveRecord::Base
  serialize :participantes, Hash
  serialize :financiadores, Hash

  validates :nome, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :descricao, :presence => true
  validates :participantes, :presence => true
  validates :financiadores, :presence => true
end
