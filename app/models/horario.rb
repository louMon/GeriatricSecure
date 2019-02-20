class Horario < ApplicationRecord
  belongs_to :usuario
  enum estado: [:Libre, :Ocupada]

  scope :horarios_por_usuario, -> (current_usuario) {where(usuario_id: current_usuario)}

end
