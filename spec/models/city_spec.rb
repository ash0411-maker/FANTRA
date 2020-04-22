require 'rails_helper'
RSpec.describe City, type: :model do

    context "都市のデータが正しく保存される" do
        before do
            @city = City.new
            @city.id = 1
            @city.name = "東京"
            @city.save
        end
        it "全て入力してあるので保存される" do
            expect(@city).to be_valid
        end
    end
end