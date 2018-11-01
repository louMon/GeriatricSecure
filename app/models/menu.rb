class Menu < ApplicationRecord
  belongs_to :rol

  scope :get_default_tab, -> (tab_name) { where(default: true).find_by_name tab_name }

  scope :admin_tabs, -> () {where(disponible_admin: true)}
  scope :recepcionista_tabs, -> () {where(disponible_recepcionista: true)}
  scope :enfermero_tabs, -> () {where(disponible_enfermero: true)}
  scope :medico_tabs, -> () {where(disponible_paciente: true)}
  scope :paciente_tabs, -> () {where(disponible_medico: true)}

  def self.names
    Menu.pluck(:nombre) 
  end

end
