class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]
  before_action :set_signos_vitales, only: [:show, :edit, :update]

  def show
  end

  def edit
    @registroconsultum.citum.usuario
    @registroconsultum.diagnostico_x_registro_consulta.build
    #@registroconsultum.citum.completar_consulta ## descomentarlo cuando ya este validado@!!
  end

  def update
    if @registroconsultum.update(registro_consultum_params)
      ap "Actualizo la consulta"
      #@registroconsultum.citum.completar_receta #cambio de estado
      #redirect_to recomendacion_receta_edit_path, :notice =>"La consulta fue guardada exitosamente"
    else 
      render :edit
    end

  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_consultum_params
      params.require(:registro_consultum).permit(:citum_id, :anamnesis, :descripcion_examen_fisico, :resultado_examen, signos_vitals_attributes: SignosVital.attribute_names.map(&:to_sym).push(:_destroy), diagnostico_x_registro_consulta_attributes: DiagnosticoXRegistroConsultum.attribute_names.map(&:to_sym).push(:_destroy))
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
