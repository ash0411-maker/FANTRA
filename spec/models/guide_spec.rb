require 'rails_helper'


RSpec.describe Guide, type: :model do
	let(:guide) { create(:guide) }


	describe '保存のテスト' do
        context 'ガイドが正しく保存される' do
		    it '全て入力されているので保存' do
		      expect(guide).to be_valid
		    end
    	end
    end


    describe 'バリデーションのテスト' do
        context 'family_nameカラム' do
		    it '空欄でないこと' do
		      guide.family_name = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'nameカラム' do
		    it '空欄でないこと' do
		      guide.name = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'phone_numberカラム' do
		    it '空欄でないこと' do
		      guide.phone_number = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'postal_codeカラム' do
		    it '空欄でないこと' do
		      guide.postal_code = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'addressカラム' do
		    it '空欄でないこと' do
		      guide.address = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'identification_image_idカラム' do
		    it '空欄でないこと' do
		      guide.identification_image_id = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'selfy_image_idカラム' do
		    it '空欄でないこと' do
		      guide.selfy_image_id = ''
		      expect(guide.valid?).to eq false;
		    end
    	end
    	context 'introductionカラム' do
		    it '250文字以下であること' do
		      guide.introduction = Faker::Lorem.characters(number:251)
		      expect(guide.valid?).to eq false;
		    end
    	end
    end

    describe 'アソシエーションのテスト' do
		context 'Tourモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:tours).macro).to eq :has_many
		  end
		end
		context 'Orderモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:orders).macro).to eq :has_many
		  end
		end
		context 'Roomモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:rooms).macro).to eq :has_many
		  end
		end
		context 'Notificationモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:notifications).macro).to eq :has_many
		  end
		end
		context 'GuideActiveNoticesモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:guide_active_notices).macro).to eq :has_many
		  end
		end
		context 'GuidePassiveNoticesモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Guide.reflect_on_association(:guide_passive_notices).macro).to eq :has_many
		  end
		end
	end

end