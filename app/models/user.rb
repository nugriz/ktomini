class User < ApplicationRecord
  rolify
  has_and_belongs_to_many :contests
  validates :username, presence: true
  validates :fullname, presence: true 

  has_secure_password
end
