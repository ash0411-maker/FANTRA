require 'rails_helper'


RSpec.describe Genre, type: :model do

    describe 'バリデーションのテスト' do
    	let(:genre) { create(:genre) }

        context 'titleカラム' do
		    it '空欄でないこと' do
		      genre.name = ''
		      expect(genre.valid?).to eq false;
		    end
    	end
    end

    describe 'アソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(Genre.reflect_on_association(:tours).macro).to eq :has_many
	    end
	  end
	end

end