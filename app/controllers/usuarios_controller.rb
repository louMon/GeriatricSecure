class UsuariosController < ApplicationController
  
  before_action :set_usuario, only: [:edit, :update]

  def edit
  end

  def update
    @usuario = Usuario.find(params[:id])
    @usuario.assign_attributes user_params
    if @usuario.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:usuario).permit(:nombre, :apellidos, :dni, :fecha_nacimiento, :genero, :estado, :telefono, :colegiatura, :categoria, :direccion, :rol, :especialidad)
    end

    def set_usuario
      @user = Usuario.find params[:id]
    end

end
