#encoding: UTF-8
class Publicacao < ActiveRecord::Base
  serialize :participantes, Hash

  validates :titulo,
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :uniqueness => {:in => true, :message => '%{value} já está sendo utilizado'},
    :length => {:minimum => 6, :message => 'muito curto, mínimo de 6 caracteres'}
  validates :ano, 
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :inclusion => {
      :in => 1980..Time.now.year,
      :message => "fora dos limites permitido"
    }
  validates :suporte, :presence => {:in => true, :message => 'não pode estar em branco'}
  validates_each :participantes do |obj, attribute, hash|
    hash.each do |key, value|
      obj.errors.add(attribute, " número "+key.last+" não pode estar em branco") unless value.present?
    end
  end
  validates :abstract, :presence => {:in => true, :message => 'não pode estar em branco'}
  validates :tipo, :presence => {:in => true, :message => 'não pode estar em branco'}
end
