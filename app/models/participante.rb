#encoding: UTF-8
require 'digest/sha2'

class Participante < ActiveRecord::Base
  validates :nome, 
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :uniqueness => {:in => true, :message => '%{value} já está sendo utilizado'},
    :length => {:minimum => 6, :message => 'está muito curto, mínimo de 6 caracteres'}
  validates :login,
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :uniqueness => {:in => true, :message => '%{value} já está sendo utilizado'},
    :length => {:minimum => 4, :message => 'está muito curto, mínimo de 4 caracteres'}
  validates :email,
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :uniqueness => {:in => true, :message => '%{value} já está sendo utilizado'},
    :inclusion => 
    {
      :in => %w(andremota@eq.ufrn.br alana_jade13@hotmail.com arlucio_pns@hotmail.com brunodezan@hotmail.com senaeq@gmail.com cristiane.parpinelli@gmail.com danielabrantesnns@hotmail.com daniel_teixeira100@hotmail.com dannielle_janainne@yahoo.com.br divalbrito@nupeg.ufrn.br ffsdias@hotmail.com graciana-oliver@hotmail.com graziele.lopes@gmail.com haggaipcf@hotmail.com hugojr@gmail.com ieda_leticia@hotmail.com itallamedeiros@yahoo.com.br jessicaclinhares@gmail.com jpaulo@digizap.com.br jafobr@nupeg.ufrn.br lucasrafael_2@hotmail.com patriciaalves.eng@hotmail.com pcpuglia@hotmail.com pedro_henriqueav@hotmail.com rafamos18@yahoo.com.br rodriguimaraes@live.com rogerwill.eq@gmail.com ruben.ochiavone@bct.ect.ufrn.br syllos@eq.ufrn.br victor.a.182@gmail.com wander_vilela@hotmail.com evazani@yahoo.com.br osvaldo@eq.ufrn.br),
      :message => '%{value} não consta na lista de e-mails válidos'
    }
  validates :projeto, :presence => {:in => true, :message => 'não pode estar em branco'}

  validates :pass,
    :confirmation => {:in => true, :message => 'não foi confirmada, ou você digitou algo errado'},
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :on => :create
  validates :pass_confirmation,
    :presence => {:in => true, :message => 'não pode estar em branco'},
    :on => :create

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
