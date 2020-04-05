class City < ApplicationRecord
	validates :name, presence: true
	has_many :tours, dependent: :destroy

	# 検索機能
	def self.match(content)
      City.find_by("(name LIKE ? )", "%#{content}%")
  	end
end
