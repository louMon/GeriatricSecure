class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]

  def show
  end

  def edit
    @registroconsultum.citum
    @registroconsultum.citum.usuario
    @registroconsultum.diagnostico_x_registro_consulta.build
    @registroconsultum.citum.completar_consulta
  end

  def update
    if @registroconsultum.update(registro_consultum_params)
      @registroconsultum.citum.completar_receta 
      #Aca falta la llamada al API
      redirect_to preview_recetum_path(@registroconsultum.citum.recetum), :notice =>"La consulta fue guardada exitosamente"
    else 
      render :edit
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_consultum_params
      params.require(:registro_consultum).permit(:citum_id, :anamnesis, :descripcion_examen_fisico, :resultado_examen, :talla, :peso, :temperatura, :nivel_azucar, :presion_arterial , diagnostico_x_registro_consulta_attributes: DiagnosticoXRegistroConsultum.attribute_names.map(&:to_sym).push(:_destroy))
    end
    
    def set_consultum
      @registroconsultum = RegistroConsultum.find(params[:id])
    end


end
