class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_variables

  def set_variables
    begin
      @usuario_menus = current_usuario.permit_tabs
    rescue
      p '************* LOG OUT ***************'
    end
  end

end
