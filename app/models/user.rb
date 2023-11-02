class User < ApplicationRecord
  #TODO Проверка валедации
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :name, presence: true
  validates :age, presence: true

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

  # def generate_remember_token
  #   self.remember_token = SecureRandom.urlsafe_base64
  # end

end
