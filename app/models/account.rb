class Account < ApplicationRecord
    has_many :movies
    validates :name, presence: true 
end
