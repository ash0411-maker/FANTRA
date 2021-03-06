class Contact < ApplicationRecord

	validates :name, presence: true
	validates :email, presence: true
	validates :user_text, presence: true, length: { maximum: 500 }

end
