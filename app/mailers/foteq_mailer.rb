class FoteqMailer < ActionMailer::Base
  def welcome(participante)
    @participante = participante
    @url = "http://smooth-mist-7945.herokuapp.com"
    mail(:from => 'no_reply@foteq.nupeg.ufrn.br', :to => participante.email, :subject => "Confirmacao de cadastro")
  end

  def contact(contact)
    @name = contact["name"]
    @from = contact["from"]
    @msg = contact["message"]
    mail(:from => contact["from"], :to => "ruben.ochiavone@bct.ect.ufrn.br", :subject => contact["subject"])
  end
end
