require 'rails_helper'


RSpec.describe Comment, type: :model do
    describe 'バリデーションのテスト' do
    	let(:guide) { create(:guide) }
    	let!(:comment) { build(:comment, guide_id: guide.id) }

        context 'contentカラム' do
		    it '空欄でないこと' do
		      comment.content = ''
		      expect(city.valid?).to eq false;
		    end
    	end
    end

    describe 'アソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it 'N:1となっている' do
	      expect(Comment.reflect_on_association(:tour).macro).to eq :belongs_to
	    end
	  end
	  context 'Touristモデルとの関係' do
	    it 'N:1となっている' do
	      expect(Comment.reflect_on_association(:tour).macro).to eq :belongs_to
	    end
	  end
	end
end