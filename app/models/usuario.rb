class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :especialidad
  #belongs_to :rol
  has_many :horarios
  has_many :cita

  enum categoria: [:Administrador, :Recepcionista, :Enfermero, :Medico, :Paciente]
  enum estado: [:Activo, :Inactivo]

  def full_name
    name.to_s + last_name.to_s
  end

  def can_view tab_reference
     permits = permit_tabs.where(tab_reference: tab_reference).first
     permits.permiso_ver
  end

  def can_create tab_reference
     permits = permit_tabs.where(tab_reference: tab_reference).first
     permits.permiso_agregar
  end

  def can_edit tab_reference
     permits = permit_tabs.where(tab_reference: tab_reference).first
     permits.permiso_editar
  end

  def permit_tabs

    if self.admin?
      Menu.order(:orden).admin_tabs
    elsif self.recepcionista?
      Menu.order(:orden).recepcionista_tabs
    elsif self.enfermero?
      Menu.order(:orden).enfermero_tabs
    elsif self.medico?
      Menu.order(:orden).medico_tabs
    else 
      Menu.order(:orden).paciente_tabs
    end
      
  end


end
