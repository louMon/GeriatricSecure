class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :especialidad
  #belongs_to :rol
  has_many :horarios
  has_many :cita

  enum categoria: [:admin, :recepcionista, :enfermero, :medico, :paciente]
  enum gender: [:male, :female]
  enum status: [:active, :inactive]

  def full_name
    name.to_s + last_name.to_s
  end


end
