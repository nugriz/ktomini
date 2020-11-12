class Contest < ApplicationRecord
    has_and_belongs_to_many :users
    has_many  :questions
    validates :title, presence: true,
                    length: { minimum: 5 }
end
