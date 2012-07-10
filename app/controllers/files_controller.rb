class FilesController < ApplicationController
  layout 'jsonly'

  def new_image
    render 'new_image'
  end

  def create_image
    @image = DataFile.savePic(params[:file])

    unless @image[0].nil?
      params[:src] = @image
      redirect_to '/files/show_image?'+@image
    else
      redirect_to '/files/new_image', notice: "ERRO: "+@image[1]["error"]
    end
  end

  def show_image
    @image = params[:src]
  end

  def destroy_image
    @image = params[:image_src]
    DataFile.removePic(@image)
    render 'new_image'
  end

  def update_image
    @participante = Participante.find(params[:id])
    @image = params[:foto_url]
    if @participante.foto_url.present?
      DataFile.removePic(@participante.foto_url)
    end
    @participante.foto_url = @image    

    if @participante.save
      flash.now[:success] = ['Sua foto foi atualizada com sucesso']
    else
      flash.now[:error] = ['Houve algum erro, tente novamente mais tarde']
    end

    render 'new_image'
  end
end
