require 'rails_helper'


RSpec.describe Tourist, type: :model do
	let(:tourist) { create(:tourist) }


	describe '保存のテスト' do
        context 'ガイドが正しく保存される' do
		    it '全て入力されているので保存' do
		      expect(tourist).to be_valid
		    end
    	end
    end


    describe 'バリデーションのテスト' do
        context 'family_nameカラム' do
		    it '空欄でないこと' do
		      tourist.family_name = ''
		      expect(tourist.valid?).to eq false;
		    end
    	end
    	context 'nameカラム' do
		    it '空欄でないこと' do
		      tourist.name = ''
		      expect(tourist.valid?).to eq false;
		    end
    	end
    	context 'phone_numberカラム' do
		    it '空欄でないこと' do
		      tourist.phone_number = ''
		      expect(tourist.valid?).to eq false;
		    end
    	end
    	context 'postal_codeカラム' do
		    it '空欄でないこと' do
		      tourist.postal_code = ''
		      expect(tourist.valid?).to eq false;
		    end
    	end
    	context 'addressカラム' do
		    it '空欄でないこと' do
		      tourist.address = ''
		      expect(tourist.valid?).to eq false;
		    end
    	end
    end

    describe 'アソシエーションのテスト' do
		context 'Orderモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:orders).macro).to eq :has_many
		  end
		end
		context 'Roomモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:rooms).macro).to eq :has_many
		  end
		end
		context 'BookMarkモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:book_marks).macro).to eq :has_many
		  end
		end
		context 'Commentモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:comments).macro).to eq :has_many
		  end
		end
		context 'Notificationモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:notifications).macro).to eq :has_many
		  end
		end
		context 'Tourist_active_noticeモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:tourist_active_notices).macro).to eq :has_many
		  end
		end
		context 'Tourist_passive_noticeモデルとの関係' do
		  it '1:Nとなっている' do
		    expect(Tourist.reflect_on_association(:tourist_passive_notices).macro).to eq :has_many
		  end
		end
	end

end












