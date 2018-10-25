class Usuario < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :rol, required: false

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nombre_usuario) = :value OR lower(correo_electronico) = :value", { :value => login.downcase }]).first
    else
      current_user = where(conditions).first
      current_user.active? ? current_user : false
    end
  end

  def omniauth_values auth
    self.correo_electronico = auth.info.email
    self.contrasenha = Devise.friendly_token[0,20]
    self.provider = auth.provider
    self.uid = auth.uid
    self.nombres = auth.info.name
    self.oauth_token = auth.credentials.token
    self.oauth_expires_at = Time.at(auth.credentials.expires_at)
  end

  def self.from_omniauth(auth)
    user = Usuario.find_by_constrasenha auth.info.email
    if user
      if !user.oauth_token
        user.omniauth_values auth
        user.save
      end
      return user
    end
    return nil
  end

end
