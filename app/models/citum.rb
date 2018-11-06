class Citum < ApplicationRecord
  belongs_to :horario
  belongs_to :usuario
  has_one :registroconsultum

  enum estado: [:Anulada, :Registrada, :Proceso_Consulta, :Proceso_Receta, :Terminada]

  after_create :set_estado, :create_consulta

  def set_estado
    self.estado=1
  end

  def create_consulta
    RegistroConsultum.create(citum_id: self) if registro_consultum.nil?
  end

  def create_receta
    Recetum.create(citum_if: self) if receta.nil?
  end

end
