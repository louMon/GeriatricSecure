class RecomendacionMedicamentosSerializer

  def initialize(args = {})
  end

  def create_perfil_paciente params
    body = {
        "sistema_medico": params["sistema_medico"],
        "antecedentes": params["antecedentes"],
        "medicamentos": params["medicamentos"],
        "estados_medicamentos": params["estados_medicamentos"],
        "diagnostico": params["diagnostico"],
        "pesos_diagnostico": params["pesos_diagnostico"]
    }
    ap 'Entro al create_prefil_paciente'
    ap body
    body    
  end


  private

  def user_object params
    user = OpenStruct.new(id: params["id"], first_name: params["first_name"], last_name: params["last_name"], email: params["email"], phone: params["phone"], gender: params["gender"], role: params["role"])
  end
end