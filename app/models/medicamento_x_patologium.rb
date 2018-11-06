class MedicamentoXPatologium < ApplicationRecord
  belongs_to :patologium
  belongs_to :medicamento
end
