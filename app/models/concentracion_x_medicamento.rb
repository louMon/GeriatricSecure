class ConcentracionXMedicamento < ApplicationRecord
  belongs_to :medicamento
  belongs_to :concentracion
end
