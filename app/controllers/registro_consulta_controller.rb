class RegistroConsultaController < ApplicationController

  before_action :set_consultum, only: [:show, :edit, :update]

  def show
  end

  def edit
    @registroconsultum.citum
    @registroconsultum.citum.usuario
    @registroconsultum.citum.horario.usuario.especialidad
    @registroconsultum.diagnostico_x_registro_consulta.build
    @registroconsultum.citum.completar_consulta

    #ap get_patologium_codigo
    #ap get_patologium_peso
    #ap get_estados_medicamentos
    #ap get_medicamentos_codigos
    #ap save_to_cronic
    #ap get_antecedentes_pacientes

  end

  def update
    if @registroconsultum.update(registro_consultum_params)
      ap 'se guardo exitosamente'
      #@registroconsultum.citum.completar_receta 
      save_to_cronic
      #Aca falta la llamada al API

      begin
        options = {
          'end_point': 'processmedication/' + params["id"],
          'token': cookies[:session_token]
        }
        body = RecomendacionMedicamentosSerializer.new().create_perfil_paciente(user_params)
        response = ApiService.new().put(body, options)
        if response[:status] == 200
          #redirect_to web_users_path
          #redirect_to preview_recetum_path(@registroconsultum.citum.recetum), :notice =>"La consulta fue guardada exitosamente"
        else
          flash.now[:success] = 'A ocurrido un error'
          render :new
        end   
      rescue Exception => e
        render 'errors/400'
      end

      #redirect_to preview_recetum_path(@registroconsultum.citum.recetum), :notice =>"La consulta fue guardada exitosamente"
    else 
      render :edit
    end

  end

  def save_to_cronic
    id_usuario = @registroconsultum.citum.usuario.id
    obj_historia = HistoriaClinica.find_by_id(id_usuario)

    id_registro_consulta = @registroconsultum.id
    lst_diagnostico = DiagnosticoXRegistroConsultum.where("registro_consultum_id":id_registro_consulta).rewhere("es_cronica":1)
    
    for i in lst_diagnostico
      a = EnfermedadCronica.create("patologium_id":i.patologium_id, "historia_clinica_id":obj_historia.id)
      a.save!
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

    #Devuelve el diccionaro de antecedentes
    def get_antecedentes_pacientes
      id_usuario = @registroconsultum.citum.usuario.id
      obj_historia = HistoriaClinica.find_by_usuario_id(id_usuario)
      lst_enfermedades_cronicas = EnfermedadCronica.where("historia_clinica_id":obj_historia.id)

      id_especialidad = @registroconsultum.citum.horario.usuario.especialidad.id
      lst_all_antecedentes = AntecedentesXEspecialidad.where("especialidad_id":id_especialidad)
      
      lst_codigos_antecedentes = {}
      for i in lst_all_antecedentes
        obj_i = Patologium.find_by_id(i.patologium_id)
        lst_codigos_antecedentes[obj_i.nombre_algoritmo] = 1 #1 significa que no tiene ese antecedente
        for j in lst_enfermedades_cronicas
          obj_j = Patologium.find_by_id(j.patologium_id)
          if (obj_i == obj_j) then
            lst_codigos_antecedentes[obj_i.nombre_algoritmo] = 0
          end
        end
      end
      lst_codigos_antecedentes
    end

    #Devuelve el diccionario de codigos de medicamentos
    def get_medicamentos_codigos
      id_especialidad = @registroconsultum.citum.horario.usuario.especialidad.id
      lst_all_medicamento = MedicamentosXEspecialidad.where("especialidad_id":id_especialidad)
      lst_estados_med = {}
      for i in lst_all_medicamento
        obj_m = Medicamento.find_by_id(i.medicamento_id)
        lst_estados_med[obj_m.nombre_algoritmo]=0
      end
      lst_estados_med
    end

    #Devuelve el arreglo de estados
    def get_medicamentos_estados
      id_especialidad = @registroconsultum.citum.horario.usuario.especialidad.id
      lst_all_medicamento = MedicamentosXEspecialidad.where("especialidad_id":id_especialidad)
      lst_estados_med = []
      for i in lst_all_medicamento
        obj_m = Medicamento.find_by_id(i.medicamento_id)
        lst_estados_med.append(obj_m.estado_algoritmo)
      end
      lst_estados_med
    end

    #Devuelve el arreglo de codigos de los diagnosticos por especialidad
    def get_patologia_codigos
      id_especialidad = @registroconsultum.citum.horario.usuario.especialidad.id
      lst_all_diagnostico = DiagnosticoXEspecialidad.where("especialidad_id":id_especialidad)
      lst_codigos = []
      for i in lst_all_diagnostico
        obj_i = Patologium.find_by_id(i.patologium_id)
        lst_codigos.append(obj_i.nombre_algoritmo)
      end
      lst_codigos
    end

    #Devuelve el arreglo de pesos asignados a los diagnosticos
    def get_patologia_pesos
      id_registro_consulta = @registroconsultum.id
      id_especialidad = @registroconsultum.citum.horario.usuario.especialidad.id

      lst_diagnostico = DiagnosticoXRegistroConsultum.where("registro_consultum_id":id_registro_consulta)
      lst_all_diagnostico = DiagnosticoXEspecialidad.where("especialidad_id":id_especialidad)

      lst_pesos = []
      for i in lst_all_diagnostico
        obj_i = Patologium.find_by_id(i.patologium_id)
        flag = 0
        for j in lst_diagnostico
          obj_j = Patologium.find_by_id(j.patologium_id)
          if (obj_i == obj_j) then
            lst_pesos.append(j.peso_patologia)
            flag = 1
          end
        end
        if (flag == 0) then
          lst_pesos.append(0.0)
        end
      end
      lst_pesos
    end


    def paciente_params
      body = {
        paciente: {
          "sistema_medico": @registroconsultum.citum.horario.usuario.especialidad.nombre,
          "antecedentes": get_antecedentes_pacientes,
          "medicamentos": get_medicamentos_codigos,
          "estados_medicamentos": get_medicamentos_estados,
          "diagnostico": get_patologia_codigos,
          "pesos_diagnostico": get_patologia_pesos
        }
      }
      paciente
    end

end
