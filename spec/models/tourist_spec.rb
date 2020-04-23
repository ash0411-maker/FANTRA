require 'rails_helper'
RSpec.describe Tourist, type: :model do

    describe '保存のテスト' do
        context "ツーリストのデータが正しく保存される" do
            before do
                @tourist = Tourist.new
                @tourist.id = 1
                @tourist.is_active = true
                @tourist.family_name = "大久保"
                @tourist.name = "利通"
                @tourist.sex = "男性"
                @tourist.birth_year = 1995
                @tourist.nationality = "日本"
                @tourist.postal_code = "616-8322"
                @tourist.address = "千葉県市川市"
                @tourist.phone_number = "080-5324-1608"
                @tourist.email = "a@a"
                @tourist.password = "123456"
            end
            it "全て入力してあるので保存される" do
                expect(@tourist).to be_valid
            end
        end
    end

end