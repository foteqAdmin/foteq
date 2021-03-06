# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :default_session

  def default_session
    session[:login] ||= false
    session[:permission] ||= nil
    session[:login_name] ||= nil
  end
  
  def login
    if participante = Participante.authenticate(params[:name],params[:pass])
      session[:login] = true
      session[:permission] = participante.permission
      session[:login_name] = params[:name]
      redirect_to "/participantes/"+participante.id.to_s
    else
      flash[:error] = ['Login ou senha inválidos.']
      redirect_to :back
    end
  end
  
  def logout
    session[:login] = false
    session[:permission] = nil
    redirect_to :back
  end
end
