class ConcentracionXMedicamento < ApplicationRecord
  has_many :medicamento
  has_many :concentracion
end
