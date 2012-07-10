# encoding: utf-8

class ParticipantesController < ApplicationController
  def index
    @osvaldo = Participante.find(1)
    @participante = Participante.all
    @participante = @participante.sort_by {|p|[p.nome.downcase]}
  end

  def show
    if Participante.find_by_id(params[:id]).present?
      @participante = Participante.find(params[:id])

			#get this participante publicacoes
			@pubs = Array.new
			@publicacoes = Publicacao.all
			@publicacoes.each do |p|
				p.participantes.each_value do |parts|
					if @participante.nome == parts
						@pubs.push(p)
					end
				end
			end

			#get this participante pesquisas
			@psq = Array.new
			@pesquisas = Pesquisa.all
			@pesquisas.each do |p|
				p.participantes.each_value do |parts|
					if @participante.nome == parts
						@psq.push(p)
					end
				end
			end

    else
      flash[:notice] = ["Participante não existe ou você digitou errado."]
      redirect_to "/participantes"
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
        flash[:notice] = ["Desculpe, mas você não tem permissão para editar este participante."]
        redirect_to "/participantes"
      end
    else
      flash[:notice] = ["Desculpe, mas você não tem permissão para editar este participante ou você tem que fazer login para editar."]
      redirect_to "/participantes"
    end
  end

  def create
    @participante = Participante.new(params[:participante])

    if @participante.save
      FoteqMailer.welcome(@participante).deliver
      flash[:success] = ['Participante '+@participante.nome+' foi criado com sucesso.']
      redirect_to @participante
    else
      render 'new'
    end
  end

  def update
    @participante = Participante.find(params[:id])

    if @participante.update_attributes(params[:participante])
      flash[:success] = ['Participante '+@participante.nome+' foi atualizado com sucesso.']
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
      flash[:success] = ['Participante '+@participante.nome+' foi deletado com sucesso.']
      redirect_to participantes_path
    else
      flash[:error] = ['Algum erro ocorreu quando '+@participante.nome+' foi ser removido.']
      redirect_to "/participantes"
    end
  end

end
