class CitaController < ApplicationController

  before_action :set_citum, only: [:show, :edit, :update]

  def index
    @cita = Citum.buscando_citas current_usuario
  end

  def new
    @citum = Citum.new
  end

  def show
    
  end

  def create
    @citum = Citum.new cita_params
    @especialidades = Especialidad.all
    @usuarios = Usuario.all

    respond_to do |format|
      if @citum.save
        format.html { redirect_to @citum, notice: 'La cita fue creada exitosamente' }
        redirect_to cita_path
      else
        render :new
      end
    end
  end

  def edit

  end

  def update
    @citum.assign_attributes cita_params
    if @citum.save
      redirect_to cita_path , :notice =>"La cita fue editada exitosamente"
    else 
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citum
      @citum = Citum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cita_params
      params.require(:citum).permit(:horario_id, :usuario_id, :estado)
    end

end
