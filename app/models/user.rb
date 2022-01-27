class User < ApplicationRecord
  has_secure_password
  has_many :url, dependent: :destroy_async
  validates(
    :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 150, minimum: 5 },
    format: {
      with: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z/i,
      message: 'Email Inválido',
    },
  )
end
