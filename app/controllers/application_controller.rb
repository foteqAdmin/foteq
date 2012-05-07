class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login
    if participante = Participante.authenticate(params[:name],params[:pass])
      session[:login] = true
      session[:permission] = participante.permission
      session[:login_name] = params[:name]
      flash[:success] = 'Bem-vindo '+participante.nome+'!'
      redirect_to "/participantes/"+participante.id.to_s
    else
      flash[:error] = 'Invalid login/senha.'
      redirect_to :back
    end
  end
  
  def logout
    session[:login] = false
    session[:permission] = nil
    redirect_to :back
  end
end
