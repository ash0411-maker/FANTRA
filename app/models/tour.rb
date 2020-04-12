class Tour < ApplicationRecord

	belongs_to :guide
	belongs_to :genre
	belongs_to :city
  has_many :book_marks, dependent: :destroy
  has_many :tour_photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  # ビューからデータを送る際に、ツアーと一緒にツアー写真を送るための記述
  # reject_if => 指定した条件下においてvalidationを無効にする
  accepts_nested_attributes_for :tour_photos, reject_if: :all_blank, allow_destroy: true

  #ツアーの詳細画面で表示するgooglemap
  geocoded_by :meetingpoint_address
  after_validation :geocode, if: :meetingpoint_address_changed?



  validates :genre_id, presence: true
  validates :city_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :meetingpoint_introduction, presence: true, length: { maximum: 100 }
  validates :meetingpoint_address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :contents_of_price, presence: true
  validates :time, presence: true


  # ブックマーク機能
  def bookmarked_by?(tourist)
    self.book_marks.where(tourist_id: tourist.id).exists?
  end

end
