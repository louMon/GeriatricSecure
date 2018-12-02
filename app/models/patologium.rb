class Patologium < ApplicationRecord
  belongs_to :especialidad, optional:true
end
