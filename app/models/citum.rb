class Citum < ApplicationRecord
  belongs_to :horario
  belongs_to :usuario
  has_many :registroconsultum
end
