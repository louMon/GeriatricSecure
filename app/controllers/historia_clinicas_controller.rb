class HistoriaClinicasController < ApplicationController
  
  before_action :set_historia_clinica, only: [:show, :edit, :update]

  def show
  end

  def edit
    @historia_clinica.usuario
    @signos_vital
    @diagnostico_x_registro_consultum
  end

  def update
    @historia_clinica.assign_attributes historia_clinica_params
    if @historia_clinica.save
      redirect_to cita_path
    else 
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_clinica
      @historia_clinica = HistoriaClinica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
end
