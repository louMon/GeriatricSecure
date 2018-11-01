class HistoriaClinicasController < ApplicationController
  
  before_action :set_historia_clinica, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_clinica
      @historia_clinica = Historiaclinica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
end
