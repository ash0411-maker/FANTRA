class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :tours
	validates :name, presence: true
end
