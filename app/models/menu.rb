class Menu < ApplicationRecord
  has_many :rols

  scope :admin_tabs, -> () {where(disponible_admin: true)}
  scope :recepcionista_tabs, -> () {where(disponible_recepcionista: true)}
  scope :enfermero_tabs, -> () {where(disponible_enfermero: true)}
  scope :medico_tabs, -> () {where(disponible_paciente: true)}
  scope :paciente_tabs, -> () {where(disponible_medico: true)}

  def self.names
    Menu.pluck(:nombre) 
  end

end
