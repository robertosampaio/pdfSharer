#encoding: utf-8

class RelatoriosController < ApplicationController
  def index
    user = User.find(current_user.id)
    @relatorios = user.relatorios
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
