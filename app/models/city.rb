class City < ApplicationRecord
	validates :name, presence: true
	has_many :tours, dependent: :destroy
end
