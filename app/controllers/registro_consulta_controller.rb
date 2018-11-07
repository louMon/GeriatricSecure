class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]
  
  def new
    
  end

  def show

  end

  def create
    @registroconsultum = RegistroConsultum.new registro_consultum_params

    respond_to do |format|
      if @registroconsultum.save
        format.html { redirect_to @registroconsultum, notice: 'El registro fue creado exitosamente' }
        redirect_to cita_path
      else
        render :new
      end
    end
  end

  def edit()
    @signos_vital = SignosVital.new
    @diagnostico_x_registro_consultum = DiagnosticoXRegistroConsultum.new
    @registroconsultum = RegistroConsultum.new
  end

  def update
    @registroconsultum.assign_attributes registro_consultum_params
    if @registroconsultum.save
      redirect_to cita_path
    else 
      render :edit
    end
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
