class User < ApplicationRecord
    has_secure_password validations: false
    has_many :accounts
    validates :name, :password_digest, presence: true 
end
