require 'rails_helper'
RSpec.describe Guide, type: :model do

    context "ガイドのデータが正しく保存される" do
        before do
            @guide = Guide.new
            @guide.id = 1
            @guide.email = "z@z"
            @guide.password = "123456"
            @guide.encrypted_password = "123456"
            @guide.is_active = true
            @guide.family_name = "斎藤"
            @guide.name = "道三"
            @guide.nationality = "日本"
            @guide.postal_code = "食費、宿泊費"
            @guide.address = "千葉県市原市田尻4-10-6"
            @guide.phone_number = "4時間"
            @guide.introduction = "○○大学○○学部4年の××です大学では観光社会学を専攻しており、卒業論文では、国内"
            @guide.selfy_image_id = "6fef41105f32059a72fc29fd83c0c6c6b92c9fe0b53bd1d676"
            @guide.identification_image_id = "6fef41105f32059a72fc29fd83c0c6c6b92c9fe0b53bd1d676"
            @guide.save
        end
        it "全て入力してあるので保存される" do
            expect(@guide).to be_valid
        end
    end
end