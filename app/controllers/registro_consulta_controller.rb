class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]

  def show
  end

  def edit
    @registroconsultum.citum.usuario
    @registroconsultum.citum.completar_consulta
    @signos_vital = SignosVital.new
    @diagnostico_x_registro_consultum = DiagnosticoXRegistroConsultum.new
  end

  def update
    @registroconsultum.assign_attributes registro_consultum_params
    @signos_vital = signos_vitales_params # preguntar al gordi
    
    if @registroconsultum.save and @signos_vital.save
      @registroconsultum.citum.completar_receta
      redirect_to recomendacion_receta_edit_path
    else 
      render :edit
    end
  end

  def signos_vitales_params
      params.require(:signosvital).permit(:registro_consultum_id, :talla, :peso, :nivel_azucar, :temperatura, :presion_arterial)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_consultum_params
      params.require(:registroconsultum).permit(:anamnesis, :descripcion_exam_fisico, :resultado_examen, :citum_id, :historiaclinica_id)
    end
    
    def set_consultum
      @registroconsultum = RegistroConsultum.find(params[:id])
    end


end
