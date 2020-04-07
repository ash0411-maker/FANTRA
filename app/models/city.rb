class City < ApplicationRecord
	validates :name, presence: true
	has_many :tours, dependent: :destroy

	# 検索機能
	def self.match(content)
      City.find_by("(name LIKE ? )", "%#{content}%")
  	end



  	# Qiitaを参考にしてgooglemapを表示させようとしたができなかった。
  	# geocorder 自動で都市名の緯度、経度をカラムlatitude,longitudeに記述
	# geocoded_by :name
	# after_validation :geocode, if: :name_changed?
end
