class MedicamentosXEspecialidad < ApplicationRecord
  belongs_to :medicamento
  belongs_to :especialidad
end
