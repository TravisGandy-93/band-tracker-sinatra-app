class User < ActiveRecord::Base
  has_secure_password
  has_many :tracks
  has_many :bands, through: :tracks

  validates :username, presence: true, uniqueness: true
end