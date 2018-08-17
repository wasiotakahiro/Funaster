class Funastar < ApplicationRecord
  belongs_to :user
    validates :name, presence: true
    validates :email, length: { in: 1..140 }
    has_many :employees
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end
