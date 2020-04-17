class Tour < ApplicationRecord

	belongs_to :guide
	belongs_to :genre
	belongs_to :city
  has_many :book_marks, dependent: :destroy
  has_many :tour_photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # ビューからデータを送る際に、ツアーと一緒にツアー写真を送るための記述
  # reject_if => 指定した条件下においてvalidationを無効にする
  accepts_nested_attributes_for :tour_photos, reject_if: :all_blank, allow_destroy: true

  #ツアーの詳細画面で表示するgooglemap
  geocoded_by :meetingpoint_address
  after_validation :geocode, if: :meetingpoint_address_changed?



  validates :genre_id, presence: true
  validates :city_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 400 }
  validates :meetingpoint_introduction, presence: true, length: { maximum: 200 }
  validates :meetingpoint_address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :contents_of_price, presence: true
  validates :time, presence: true


  # ブックマーク機能
  def bookmarked_by?(tourist)
    self.book_marks.where(tourist_id: tourist.id).exists?
  end




  # # 通知機能
  # def create_notification_like!(current_tourist)
  #   # すでに「ブックマーク」されているか検索
  #   temp = Notification.where(["visitor_id = ? and visited_id = ? and tour_id = ? and action = ? ", current_tourist.id, guide_id, id, 'like'])
  #   # ブックマークされていない場合のみ、通知レコードを作成
  #   if temp.blank?
  #     notification = current_tourist.new(
  #       post_id: id,
  #       visited_id: guide_id,
  #       action: 'like'
  #     )
  #     # 自分の投稿に対するいいねの場合は、通知済みとする
  #     if notification.visitor_id == notification.visited_id
  #       notification.checked = true
  #     end
  #     notification.save if notification.valid?
  #   end
  # end



end
