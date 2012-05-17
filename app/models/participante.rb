require 'digest/sha2'

class Participante < ActiveRecord::Base
  validates :nome, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :login, :presence => true, :uniqueness => true, :length => {:minimum => 6}
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :projeto, :presence => true
  
  validates :pass, :confirmation => true
  attr_accessor :pass_confirmation
  attr_reader :pass

  def Participante.authenticate(name, pass)
    if participante = find_by_login(name)
      if participante.password == encrypt_password(pass, participante.salt)
        participante
      end
    end
  end

  def Participante.encrypt_password(pass, salt)
    Digest::SHA2.hexdigest(pass + "wibble" + salt)
  end

  def pass=(pass)
    @pass = pass

    if pass.present?
      generate_salt
      self.password = self.class.encrypt_password(pass, salt)
    end
  end
  
  private
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end

end
