class Tourist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  acts_as_paranoid


  has_many :orders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: 'visitor_id', dependent: :destroy



  validates :family_name, presence: true
	validates :name, presence: true
	validates :birth_year, presence: true, length: { is: 4 }
	validates :nationality, presence: true
	validates :phone_number, presence: true
	validates :sex, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true
end
