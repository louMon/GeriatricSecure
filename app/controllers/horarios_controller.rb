class HorariosController < ApplicationController
  
  before_action :set_citum, only: [:show, :edit, :update]

  def index
    @horarios = Horario.horarios_por_usuario(current_usuario).order(:dia)
  end

  def new
    @horario = Horario.new
  end

  def create
    @horario = Horario.new horario_params

    respond_to do |format|
      if @horario.save
        format.html { redirect_to @horario, notice: 'El horario fue creado exitosamente' }
        redirect_to horarios_path
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:horario,:dia, :usuario_id)
    end
end
