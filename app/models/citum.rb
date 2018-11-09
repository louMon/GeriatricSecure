class Citum < ApplicationRecord
  belongs_to :horario
  belongs_to :usuario
  has_one :registro_consultum
  has_one :recetum

  enum estado: [:Anulada, :Registrada, :Proceso_Consulta, :Proceso_Receta, :Terminada]

  after_create :create_consulta , :create_receta, :set_estado_inicial

  scope :cita_por_usuario, -> (current_usuario) {where(usuario_id: current_usuario)}

  scope :cita_por_horario_usuario, -> (horario) {where(horario_id: horario)}
  
  def set_estado_inicial
    self.estado = 1
    self.save
  end

  def create_consulta
    RegistroConsultum.create(citum: self) if registro_consultum.nil?
  end

  def create_receta
    Recetum.create(citum: self) if recetum.nil?
  end

  def completar_consulta
    self.update(estado:Proceso_Consulta)
  end

  def completar_receta
    self.update(estado:Proceso_Receta)
  end

  def terminar_cita
    self.update(estado:Terminada)
  end

  def self.buscando_citas current_usuario
    if current_usuario.categoria=='Paciente' then
      cita_por_usuario(current_usuario)
    else
      horario = Horario.horarios_por_usuario(current_usuario)
      cita_por_horario_usuario(horario)
    end
  end

  def self.buscando_pacientes_por_medico current_usuario
    horarios = Horario.horarios_por_usuario(current_usuario)
    cita = cita_por_horario_usuario(horarios)
    pacientes = Usuario.buscar_pac(cita)
  end


end
