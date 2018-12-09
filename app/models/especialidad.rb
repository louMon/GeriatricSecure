class Especialidad < ApplicationRecord
  has_many :usuarios
  has_many :patologia
  has_many :antecedentes_x_especialidads
  has_many :medicamentos_x_especialidads
  has_many :diagnostico_x_especialidads
end
