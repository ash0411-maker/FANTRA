require 'rails_helper'


RSpec.describe ChatNotice, type: :model do
    describe 'バリデーションのテスト' do
    	let(:city) { create(:city) }

        context 'titleカラム' do
		    it '空欄でないこと' do
		      city.name = ''
		      expect(city.valid?).to eq false;
		    end
    	end
    end

    describe 'アソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(City.reflect_on_association(:tours).macro).to eq :has_many
	    end
	  end
	end
end
