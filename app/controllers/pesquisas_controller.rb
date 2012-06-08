# encoding: utf-8

class PesquisasController < ApplicationController
  def index
    @pesquisa = Pesquisa.all
    @pesquisa = @pesquisa.reverse
  end

  def show
    @pesquisa = Pesquisa.find(params[:id])
  end

  def new
    if session[:permission] == 'admin'
      @pesquisa = Pesquisa.new
    else
      flash[:notice] = "Desculpe, mas você não tem permissão para criar novas pesquisas."
      redirect_to "/pesquisas"
    end
  end

  def edit
    if session[:login] and session[:permission] == 'admin'
      @pesquisa = Pesquisa.find(params[:id])
    else
      flash[:notice] = "Desculpe, mas você não tem permissão para editar esta pesquisa ou não exista."
      redirect_to "/pesquisas"
    end
  end

  def create
    @pesquisa = Pesquisa.new(params[:pesquisa])

    if @pesquisa.save
      flash[:success] = 'Pesquisa '+@pesquisa.nome+' foi criada com sucesso.'
      redirect_to @pesquisa
    else
      render 'new'
    end
  end

  def update
    @pesquisa = Pesquisa.find(params[:id])

    if @pesquisa.update_attributes(params[:pesquisa])
      flash[:success] = 'Pesquisa '+@pesquisa.nome+' foi atualizada com sucesso.'
      redirect_to pesquisas_path
    else
      render 'edit'
    end
  end

  def destroy
    @pesquisa = Pesquisa.find(params[:id])
    if @pesquisa.destroy
      flash[:success] = 'Pesquisa '+@pesquisa.nome+' foi removida com sucesso.'
      redirect_to pesquisas_path
    else
      flash[:error] = 'Algum erro ocorreu quando '+@pesquisa.nome+' foi ser removida.'
      redirect_to :back
    end
  end

end
