class User < ApplicationRecord
  has_secure_password
  has_many :url, dependent: :destroy_async
  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 150, minimum: 5 },
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Email Inválido' }
end
