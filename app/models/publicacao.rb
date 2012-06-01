class Publicacao < ActiveRecord::Base
  serialize :participantes, Hash

  validates :participantes, :presence => true
  validates :titulo, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :ano, :presence => true, :inclusion =>
  {
    :in => 1980..Time.now.year,
    :message => "is out of range"
  }
  validates :suporte, :presence => true
  validates :tipo, :presence => true
end
