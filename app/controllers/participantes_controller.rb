class ParticipantesController < ApplicationController
  def index
    @participante = Participante.all
  end

  def show
    if Participante.find_by_id(params[:id]).present?
      @participante = Participante.find(params[:id])
    else
      render 'public/404.html'
    end
  end

  def new
    if session[:permission] == 'admin'
      @participante = Participante.new
    else
      render 'public/404.html'
    end
  end

  def edit
    if session[:login]
      if session[:permission] == 'admin'
        @participante = Participante.find(params[:id])
      elsif Participante.find_by_login(session[:login_name]) == Participante.find(params[:id])
        @participante = Participante.find(params[:id])
      else
        render 'public/404.html'
      end
    else
       render 'public/404.html'
    end
  end

  def create
    @participante = Participante.new(params[:participante])

    if @participante.save
      flash[:success] = 'Participante '+@participante.nome+' was successfully created'
      redirect_to @participante
    else
      render 'new'
    end
  end

  def update
    @participante = Participante.find(params[:id])

    if @participante.update_attributes(params[:participante])
      flash[:success] = 'Participante '+@participante.nome+' was successfully updated'
      redirect_to participantes_path
    else
      render 'edit'
    end
  end

  def destroy
    @participante = Participante.find(params[:id])
    if @participante.destroy
      flash[:success] = 'Participante '+@participante.nome+' was succesfully deleted'
      redirect_to participantes_path
    else
      flash[:error] = 'Algum erro ocorreu quando '+@participante.nome+' foi ser removido.'

    end
  end

end
