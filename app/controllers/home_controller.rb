class HomeController < ApplicationController
  def show
  end

  def contato
    @contact = params[:contact]
    if FoteqMailer.contact(@contact).deliver
      flash[:success] = "Sua mensagem foi enviada com sucesso. Obrigado por entrar em contato conosco."
      redirect_to "/home/contato"
    else
      flash[:success] = "Ocorreu algum erro e sua mensagem nao pode ser enviada."
      redirect_to "/home/contato"
    end
  end
end
