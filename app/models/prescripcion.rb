class Prescripcion < ApplicationRecord
  belongs_to :recetum
  belongs_to :concentracion_x_medicamento
end
