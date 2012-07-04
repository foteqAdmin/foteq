# encoding: utf-8

class HomeController < ApplicationController
  def show
  end

  def contato
    @contact = params[:contact]

    #validate contact
    error_count = 0
    msg = Array.new
    unless @contact['name'].present?
      msg[error_count] = "Nome não pode estar em branco"
      error_count = error_count + 1
      @contact['name'] = @contact['name']+"*"
    end

    if @contact['from'].present?
      unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.match(@contact['from'])
        msg[error_count] = "Email inválido"
        error_count = error_count + 1
        @contact['from'] = @contact['from']+"*"
      end
    else
      msg[error_count] = "Email não pode estar em branco"
      error_count = error_count + 1
      @contact['from'] = @contact['from']+"*"
    end

    unless @contact['subject'].present?
      msg[error_count] = "Assunto não pode estar em branco"
      error_count = error_count + 1
      @contact['subject'] = @contact['subject']+"*"
    end

    if @contact['message'].present?
      unless @contact['message'].length > 20
        msg[error_count] = "Mensagem muito curta, escreva pelo menos 20 caracteres para serem enviados"
        error_count = error_count + 1
        @contact['message'] = @contact['message']+"*"
      end
    else
      msg[error_count] = "Mensagem não pode estar em branco"
      error_count = error_count + 1
      @contact['message'] = @contact['message']+"*"
    end

    if error_count > 0
      flash[:error] = msg
      redirect_to home_contato_path({:name => @contact['name'], :email => @contact['from'], :subject => @contact['subject'], :message => @contact['message']})
    else
      if FoteqMailer.contact(@contact).deliver
        flash[:success] = ["Sua mensagem foi enviada com sucesso. Obrigado por entrar em contato conosco."]
        redirect_to "/home/contato"
      else
        flash[:success] = ["Ocorreu algum erro e sua mensagem não pôde ser enviada."]
        redirect_to "/home/contato"
      end  
    end
  end

end
