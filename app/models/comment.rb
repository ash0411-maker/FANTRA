class Comment < ApplicationRecord
  belongs_to :tourist
  belongs_to :tour
  validates :content, presence: true
end