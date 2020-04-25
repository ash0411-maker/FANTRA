class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid

  attachment :identification_image
  attachment :selfy_image

  has_many :orders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :notifications, foreign_key: 'guide_id', dependent: :destroy
  has_many :guide_active_notices, class_name: 'ChatNotice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :guide_passive_notices, class_name: 'ChatNotice', foreign_key: 'visited_id', dependent: :destroy


  validates :name, presence: true
  validates :family_name, presence: true
  validates :nationality, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :identification_image, presence: true
  validates :selfy_image, presence: true
  validates :phone_number, presence: true
  validates :introduction, length: { maximum: 250 }

end

