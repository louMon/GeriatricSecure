class Rol < ApplicationRecord
  has_many :menus
  has_many :usuarios

  accepts_nested_attributes_for :menus, reject_if: :all_blank, allow_destroy: true
  enum estado: [:Activo, :Inactivo]

  def menus
    begin
      self.menus
    rescue Exception => e
      []      
    end
  end

end
