class Message < ApplicationRecord

  belongs_to :room, optional: true
  has_many :chat_notices, dependent: :destroy


  validates :content, presence: true

end
