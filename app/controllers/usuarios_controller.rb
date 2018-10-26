class UsuariosController < ApplicationController
  
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @usuario.assign_attr user_params, params
    if @usuario.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:usuario).permit(:nombre, :apellidos, :dni, :fecha_nacimiento, :genero, :estado, :telefono, :direccion, :rol, :especialidad)
    end

    def set_user
      @user = Usuario.find params[:id]
  end
end
