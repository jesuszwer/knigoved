class User < ApplicationRecord

  before_create :set_default_admin

  #TODO Проверка валедации
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :name, presence: true
  validates :age, presence: true

  # validates_inclusion_of  :its_admin, in: [true, false]

  #TODO Дополнительные какие нибудь функции, методы и т.п
  has_secure_password
  # before_create :generate_remember_token

  #TODO Шифрование пароля для пользователя
  def authenticate(password)
    if BCrypt::Password.new(self.password_digest) == password
      self
    else
      false
    end
  end

  def set_default_admin
    self.its_admin = false if self.its_admin.nil?
  end


  # def generate_remember_token
  #   self.remember_token = SecureRandom.urlsafe_base64
  # end

end
