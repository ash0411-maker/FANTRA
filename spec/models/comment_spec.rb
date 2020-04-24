require 'rails_helper'


RSpec.describe Comment, type: :model do
	let(:tourist) { create(:tourist) }
    let(:tour) { create(:tour) }
    let!(:comment) { build(:comment, tourist_id: tourist.id, tour_id: tour.id) }



    describe 'Comment保存のテスト' do
        context 'レビューコメントが正しく保存される' do
		    it '全て入力されているので保存' do
		      expect(comment).to be_valid
		    end
    	end
    end



    describe 'Commentバリデーションのテスト' do
        context 'contentカラム' do
		    it '空欄でないこと' do
		      comment.content = ''
		      expect(comment.valid?).to eq false;
		    end
		    it '200文字以下であること' do
		      comment.content = Faker::Lorem.characters(number:201)
		      expect(comment.valid?).to eq false;
		    end
    	end
    end


    describe 'Commentアソシエーションのテスト' do
	  context 'Tourモデルとの関係' do
	    it 'N:1となっている' do
	      expect(Comment.reflect_on_association(:tour).macro).to eq :belongs_to
	    end
	  end
	  context 'Touristモデルとの関係' do
	    it 'N:1となっている' do
	      expect(Comment.reflect_on_association(:tourist).macro).to eq :belongs_to
	    end
	  end
	end

end
