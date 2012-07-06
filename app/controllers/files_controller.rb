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
end
