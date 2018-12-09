class HistoriaClinica < ApplicationRecord
  belongs_to :usuario, :foreign_key => "usuario_id"
  has_many :enfermedad_cronicas
end
