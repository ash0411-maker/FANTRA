class Order < ApplicationRecord
	belongs_to :tourist
	belongs_to :guide

	# enum order_status: { before_starting: 0, tour_day: 1, touring: 2, finised: 3 }
	enum status: { ツアー開始前: 0,ツアー前日: 1, ツアー当日: 2, ツアー中: 3, ツアー終了: 4, レビュー済み: 5 }
end
