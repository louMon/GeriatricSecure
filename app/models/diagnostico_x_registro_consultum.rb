class DiagnosticoXRegistroConsultum < ApplicationRecord
  belongs_to :registro_consultum , optional: true
  belongs_to :patologium
end
