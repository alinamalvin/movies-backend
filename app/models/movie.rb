class Movie < ApplicationRecord
    belongs_to :account
    validates :name, presence: true 
    validates_inclusion_of :kind, :in => ['horror', 'comedy', 'thriller', 'detective', 'documentary', 'other']
end
