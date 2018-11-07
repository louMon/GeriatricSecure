class RegistroConsultum < ApplicationRecord
  belongs_to :citum, :foreign_key => "citum_id"
end
