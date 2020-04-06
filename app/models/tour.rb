class Tour < ApplicationRecord

	belongs_to :guide
	belongs_to :genre
	belongs_to :city
  has_many :book_marks, dependent: :destroy

  # ツアー写真を複数枚投稿
	has_many :tour_photos, dependent: :destroy
  accepts_attachments_for :tour_photos, attachment: :image

  validates :genre_id, presence: true
  validates :city_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :contents_of_price, presence: true


  # ブックマーク機能
  def bookmarked_by?(tourist)
    self.book_marks.where(tourist_id: tourist.id).exists?
  end

end
