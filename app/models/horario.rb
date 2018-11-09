class Horario < ApplicationRecord
  belongs_to :usuario

  scope :horarios_por_usuario, -> (current_usuario) {where(usuario_id: current_usuario)}

end
