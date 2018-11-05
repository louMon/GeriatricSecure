class DiagnosticoXRegistroConsultum < ApplicationRecord
  belongs_to :registro_consultum
  belongs_to :patologium
end
