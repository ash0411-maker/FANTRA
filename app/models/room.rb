class Room < ApplicationRecord
  belongs_to :tourist
  belongs_to :guide
  has_many :messages, dependent: :destroy
  has_many :chat_notices, dependent: :destroy
end
