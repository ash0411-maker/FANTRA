class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :tours, dependent: :destroy
	validates :name, presence: true
end
