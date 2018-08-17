class User < ApplicationRecord
  has_many :funastars
  has_many :favorites, dependent: :destroy
  has_many :favorite_funastars, through: :favorites, source: :funastar

  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  before_validation { email.downcase! }
end
