class PacientesController < ApplicationController

  before_action :set_paciente, only: [:edit, :update,:show, :toggle_status]
  before_action :roles, only: [:new, :create, :update, :edit]

  def index
     @pacientes = Usuario.all.Paciente
  end

  def new
    @paciente = Usuario.new
  end

  def create
    @paciente = Usuario.new paciente_params
    if (@paciente.set_password).save
      @paciente.paciente!
      redirect_to pacientes_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @paciente.assign_attributes paciente_params.except(:password)
    ap @paciente.errors
    if @paciente.save
      redirect_to pacientes_path, notice: 'Datos del paciente fueron editados'
    else 
      render :edit
    end
  end

  def toggle_status
    @paciente.change_status
    respond_to do |format|
      format.js
    end
  end

  private

    def paciente_params
      params.require(:usuario).permit(:nombres, :apellidos, :dni, :fecha_nacimiento, :genero, :telefono,:estado, :categoria, :direccion)
    end

    def set_paciente
      @paciente = Usuario.find params[:id]
    end

    def roles
      @rols = Rol.all
    end
end
