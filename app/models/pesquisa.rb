#encoding: UTF-8
class Pesquisa < ActiveRecord::Base
  serialize :participantes, Hash
  serialize :financiadores, Hash

  validates :nome,
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :uniqueness => {:in => true, :message => '%{value} já está sendo utilizado'},
    :length => {:minimum => 6, :message => 'muito curto, mínimo de 6 caracteres'}
  validates :descricao, :presence => {:in => true, :message => 'não pode estar em branco'}
  validates_each :participantes do |obj, attribute, hash|
    hash.each do |key, value|
      obj.errors.add(attribute, " número "+key.last+" não pode estar em branco") unless value.present?
    end
  end
  validates_each :financiadores do |obj, attribute, hash|
    hash.each do |key, value|
      obj.errors.add(attribute, " número "+key.last+" não pode estar em branco") unless value.present?
    end
  end
end
