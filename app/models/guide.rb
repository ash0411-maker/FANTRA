class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :identification_image

  has_many :orders
  has_many :tours, dependent: :destroy


  validates :name, presence: true
  validates :family_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :identification_image, presence: true
  validates :phone_number, presence: true
end
