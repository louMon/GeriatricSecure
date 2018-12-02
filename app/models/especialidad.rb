class Especialidad < ApplicationRecord
  has_many :usuarios
  has_many :patologia
end
