require 'rails_helper'
RSpec.describe BookMark, type: :model do

    context "ボックマークのデータが正しく保存される" do
        before do
            @book_mark = BookMark.new
            @book_mark.id = 1
            @book_mark.tourist_id = 1
            @book_mark.tour_id = 1
        end
        it "全て入力してあるので保存される" do
            expect(@book_mark).to be_valid
        end
    end
end

