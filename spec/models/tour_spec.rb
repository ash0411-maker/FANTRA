require 'rails_helper'
RSpec.describe Tour, type: :model do

    context "ツアーのデータが正しく保存される" do
        before do
            @tour = Tour.new
            @tour.id = 1
            @tour.title = "ようこそ"
            @tour.genre_id = 1
            @tour.guide_id = 1
            @tour.city_id = 1
            @tour.body = "おいでやす京都に"
            @tour.capacity = 10
            @tour.price = 10000
            @tour.contents_of_price = "食費、宿泊費"
            @tour.is_active = true
            @tour.time = "4時間"
            @tour.meetingpoint_address = "千葉県市川市田尻4-10-6"
            @tour.meetingpoint_introduction = "とある会社の社員寮です"
            @tour.save
        end
        it "全て入力してあるので保存される" do
            expect(@tour).to be_valid
        end
    end
end





