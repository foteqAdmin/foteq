#encoding:UTF-8
class DataFile < ActiveRecord::Base
  def self.savePic(url)
    filename = File.basename(url.original_filename)
    extension = File.extname(filename).downcase
    #ensures that filename is an image
    if extension != '.png' and extension != '.gif' and extension != '.jpg'
      return nil, {"error" => "Extensão do arquivo não permitida (permitido apenas *.png, *,gif e *.jpg)."}
    #only images little than 4MB
    elsif File.new(url.tempfile,'r').size > 4000000
      return nil, {"error" => "Tamanho da imagem acima do permitido (limite de 4 MB)."}
    else
      directory = "app/assets/images"
      path = File.join(directory, filename)
      File.open(path, 'wb') { |f| f.write(url.read) }
      return filename
    end
  end

  def self.removePic(url)
    directory = "app/assets/images"
    path = File.join(directory,url)
    if File.open(path)
      File.delete(path)
    end
  end

  def self.saveFile(url)
    filename = File.basename(url.original_filename)
    extension = File.extname(filename).downcase
    #ensures that filename is in pdf format
    if extension != '.pdf'
      return nil
    else
      directory = "public/pdfs"
      path = File.join(directory, filename)
      File.open(path, 'wb') { |f| f.write(url.read) }
      return filename
    end
  end

  def self.removeFile(url)
    directory = "public/pdfs"
    path = File.join(directory,url)
    if File.open(path)
      File.delete(path)
    end
  end
end
