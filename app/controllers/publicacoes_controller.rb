class PublicacoesController < ApplicationController
  def index
    @publicacoes = Publicacao.all
    @publicacoes = @publicacoes.sort_by {|p| p[:titulo]}
    @publicacoes = @publicacoes.sort_by {|p| p[:ano]}
  end

  def show
    @publicacao = Publicacao.find(params[:id])
  end

  def new
    if session[:permission] == 'admin'
      @publicacao = Publicacao.new
    else
      render 'public/404.html'
    end
  end

  def edit
    if session[:login] and session[:permission] == 'admin'
      @publicacao = Publicacao.find(params[:id])
    else
      render 'public/404.html'
    end
  end

  def create
    @hash = params[:publicacao]
    if @hash['arquivo'].present?
      @hash['arquivo'] = DataFile.saveFile(@hash['arquivo'])
    end

    @publicacao = Publicacao.new(@hash)

    if @publicacao.save
      flash[:success] = 'Publicacao '+@publicacao.titulo+' foi criada com sucesso.'
      redirect_to publicacoes_path
    else
      render 'new'
    end
  end

  def update
    @publicacao = Publicacao.find(params[:id])

    if @publicacao.update_attributes(params[:publicacao])
      flash[:success] = 'Publicacao '+@publicacao.titulo+' foi atualizada com sucesso.'
      redirect_to publicacoes_path
    else
      render 'edit'
    end
  end

  def destroy
    @publicacao = Publicacao.find(params[:id])
    if @publicacao.destroy
      flash[:success] = 'Publicacao '+@publicacao.titulo+' foi removida com sucesso.'
      redirect_to publicacoes_path
    else
      flash[:error] = 'Algum erro ocorreu quando '+@publicacao.titulo+' foi ser removida.'
      redirect_to :back
    end
  end

end
