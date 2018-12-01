class Recetum < ApplicationRecord

  belongs_to :citum, :foreign_key => "citum_id"
  has_many :prescripcion, dependent: :destroy

  accepts_nested_attributes_for :prescripcion, allow_destroy: true

end
