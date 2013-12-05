#encoding: utf-8

class RelatoriosController < ApplicationController
  def index
    @relatorios = Relatorio.search(params[:search],current_user.id)
    @relatorio = Relatorio.new
  end

  def create
    @relatorio = Relatorio.new(params[:relatorio])

    respond_to do |format|
      if @relatorio.save
        flash[:notice] = "Arquivo salvo"
        format.html { redirect_to :back }
      else
        flash[:error] = "Arquivo não salvo"
        format.html { redirect_to :back }
      end
    end
  end

end
