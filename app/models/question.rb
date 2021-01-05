class Question < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  belongs_to :contest
  has_many  :keys, dependent: :delete_all
end
