class RecetaController < ApplicationController
  
  before_action :set_recetum, only: [:preview, :show, :edit, :update]

  def preview
    @recetum.citum
    @recetum.citum.usuario
  end

  def edit
    @recetum.citum
    @recetum.citum.usuario
  end

  def update
    if @recetum.update(recetum_params)
      @recetum.citum.terminar_cita 
      redirect_to cita, :notice =>"La receta fue guardada exitosamente"
    else 
      render :edit
    end
  end

  def show
  end

  private
    def recetum_params
      params.require(:recetum).permit(:citum_id, :anamnesis, :descripcion_examen_fisico, :resultado_examen, :talla, :peso, :temperatura, :nivel_azucar, :presion_arterial , diagnostico_x_registro_consulta_attributes: DiagnosticoXRegistroConsultum.attribute_names.map(&:to_sym).push(:_destroy))
    end

    def set_recetum
      @recetum = Recetum.find(params[:id])
    end

end
