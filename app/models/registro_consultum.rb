class RegistroConsultum < ApplicationRecord
  belongs_to :historiaclinica
  belongs_to :citum
end
