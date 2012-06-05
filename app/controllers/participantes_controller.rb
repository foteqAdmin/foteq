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
    @participante = Participante.new
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
    @hash = Participante.new(params[:participante])
    if @hash['foto_url'].present?
      @hash['foto_url'] = DataFile.savePic(@hash['foto_url'])
    end

    @participante = @hash

    if @participante.save
      FoteqMailer.welcome(@participante).deliver
      flash[:success] = 'Participante '+@participante.nome+' was successfully created'
      redirect_to @participante
    else
      render 'new'
    end
  end

  def update
    @participante = Participante.find(params[:id])

    @hash = params[:participante]
    if @hash['foto_url'].class == String
      if @hash['foto_url'] != @participante.foto_url
        if @participante.foto_url != nil and @participante.foto_url != ""
          DataFile.removePic(@participante.foto_url)
        end
        @hash['foto_url'] = DataFile.savePic(@hash['foto_url'])
      end
    elsif File.basename(@hash['foto_url'].original_filename) != @participante.foto_url
      if @participante.foto_url != nil and @participante.foto_url != ""
        DataFile.removePic(@participante.foto_url)
      end
      @hash['foto_url'] = DataFile.savePic(@hash['foto_url'])
    else
      @hash['foto_url'] = File.basename(@hash['foto_url'].original_filename)
    end

    if @participante.update_attributes(@hash)
      flash[:success] = 'Participante '+@participante.nome+' was successfully updated'
      redirect_to participantes_path
    else
      render 'edit'
    end
  end

  def destroy
    @participante = Participante.find(params[:id])
    if @participante.foto_url != nil and @participante.foto_url != ""
      DataFile.removePic(@participante.foto_url)
    end

    if @participante.destroy
      flash[:success] = 'Participante '+@participante.nome+' was succesfully deleted'
      redirect_to participantes_path
    else
      flash[:error] = 'Algum erro ocorreu quando '+@participante.nome+' foi ser removido.'
      redirect_to :back
    end
  end

end
