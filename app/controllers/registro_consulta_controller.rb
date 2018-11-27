class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]
  before_action :set_signos_vitales, only: [:show, :edit, :update]

  def show
  end

  def edit
    @registroconsultum.citum.usuario
    @registroconsultum.diagnostico_x_registro_consulta.build
    @registroconsultum.citum.completar_consulta
  end

  def update
    if @registroconsultum.update(registro_consultum_params)
      @registroconsultum.citum.completar_receta 
      redirect_to preview_recetum_path, :notice =>"La consulta fue guardada exitosamente"
    else 
      render :edit
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_consultum_params
      params.require(:registro_consultum).permit(:citum_id, :anamnesis, :descripcion_examen_fisico, :resultado_examen, signos_vital_attributes: [:id, :registro_consultum_id, :talla, :peso, :nivel_azucar, :temperatura, :presio_arterial] , diagnostico_x_registro_consulta_attributes: DiagnosticoXRegistroConsultum.attribute_names.map(&:to_sym).push(:_destroy))
    end
    
    def set_consultum
      @registroconsultum = RegistroConsultum.find(params[:id])
    end

    def set_signos_vitales
      @signosvital = SignosVital.where(registro_consultum_id: @registroconsultum.id)
      p 'Signos vitales de la consulta'
      ap @signosvital
    end

end
