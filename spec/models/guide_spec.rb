require 'rails_helper'


RSpec.describe Guide, type: :model do
	let(:guide) { create(:guide) }


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