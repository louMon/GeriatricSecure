class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :especialidad, optional:true
  belongs_to :rol
  has_one :historia_clinica
  has_many :horarios
  has_many :cita

  enum categoria: [:Administrador, :Recepcionista, :Enfermero, :Medico, :Paciente]
  enum estado: [:Activo, :Inactivo]

  after_create :create_historia_clinica, :set_categoria, :set_estado

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

  def create_historia_clinica
    if(self.rol_id==5) then
      HistoriaClinica.create(usuario: self) if historia_clinica.nil?
    end
  end

  def set_estado
    self.estado = 0
    self.save
  end

  def set_categoria
    if(self.rol_id==5) then
      self.update(categoria:Paciente)
    elsif (self.rol_id==2) then
     self.update(categoria:Medico)
    elsif (self.rol_id==1) then
      self.update(categoria:Administrador)
    elsif (self.rol_id==3) then
      self.update(categoria:Recepcionista)
    elsif (self.rol_id==4) then
      self.update(categoria:Enfermero)
    end
  end


  def get_edad(fecha_nacimiento)
    now = Time.now.utc.to_date
    now.year - fecha_nacimiento.year - ((now.month > fecha_nacimiento.month || (now.month == fecha_nacimiento.month && now.day >= fecha_nacimiento.day)) ? 0 : 1)
  end


end
