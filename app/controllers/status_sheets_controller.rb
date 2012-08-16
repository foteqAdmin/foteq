#encoding: UTF-8

class StatusSheetsController < ApplicationController

  def index
    if session[:permission] == 'admin'
      @pesquisa_number = Pesquisa.all.length
      @status_sheets = StatusSheet.all
    else
      flash[:notice] = ["Você não possui permissão para acessar esta área","Ou você não realizou o login para acessá-la"]
      redirect_to :home
    end
  end

  def show
    @status_sheet = StatusSheet.find(params[:id])
  end

  def create
    @status_sheet = params[:status_sheet]

    @status_sheet.save 
=begin
    if @status_sheet.save
      #send message to participante
      # ...
    end
=end
  end

  def update
    @status_sheet = StatusSheet.find(params[:id])
    @hash = Hash.new
    @hash.store("status", params[:status])

    if @status_sheet.update_attributes(@hash)
      render :text => @status_sheet.status
    end
  end
end
