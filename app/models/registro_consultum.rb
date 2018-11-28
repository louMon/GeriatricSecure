class RegistroConsultum < ApplicationRecord

  belongs_to :citum, :foreign_key => "citum_id"
  has_many :diagnostico_x_registro_consulta, dependent: :destroy
  
  accepts_nested_attributes_for :diagnostico_x_registro_consulta, allow_destroy: true
  
end
