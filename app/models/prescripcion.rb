class Prescripcion < ApplicationRecord
  belongs_to :concentracion
  belongs_to :recetum
  belongs_to :concentracion_medicamento
end
