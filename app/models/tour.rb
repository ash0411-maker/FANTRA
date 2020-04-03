class Tour < ApplicationRecord
	belongs_to :guide
	belongs_to :genre
	belongs_to :city
	has_many :tour_photos, dependent: :destroy
  	accepts_attachments_for :tour_photos, attachment: :image
end
