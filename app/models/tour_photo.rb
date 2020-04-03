class TourPhoto < ApplicationRecord
  belongs_to :tour
  attachment :image
end