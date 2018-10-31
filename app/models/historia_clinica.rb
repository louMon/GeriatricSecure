class HistoriaClinica < ApplicationRecord
  belongs_to :usuario
  has_many :registroconsultum
end
