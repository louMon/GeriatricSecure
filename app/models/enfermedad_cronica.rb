class EnfermedadCronica < ApplicationRecord
  belongs_to :historia_clinica
  belongs_to :patologium
end
