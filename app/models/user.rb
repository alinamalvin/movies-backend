class User < ApplicationRecord
    has_many :accounts
    validates :name, :password_digest, presence: true 
end
