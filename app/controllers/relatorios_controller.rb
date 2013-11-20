class RelatoriosController < ApplicationController
  def index
    user = User.find(current_user.id)
    @relatorios = user.relatorios
  end

end
