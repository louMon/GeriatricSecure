class Patologium < ApplicationRecord
  belongs_to :especialidad, optional:true
  has_many :antecedentes_x_especialidads
  has_many :diagnostico_x_especialidads
end
