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
      render 'public/404.html'
    end
  end

  def edit
    if session[:login] and session[:permission] == 'admin'
      @pesquisa = Pesquisa.find(params[:id])
    else
      render 'public/404.html'
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
    end
  end

end
