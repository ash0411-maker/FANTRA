class Comment < ApplicationRecord

  belongs_to :tourist
  belongs_to :tour
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

end
