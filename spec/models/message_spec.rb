require 'rails_helper'


RSpec.describe Message, type: :model do
	let(:room) { create(:room) }
    let!(:message) { build(:message, room_id: room.id) }



    describe 'Message保存のテスト' do
        context 'メッセージが正しく保存される' do
		    it '全て入力されているので保存' do
		      expect(message).to be_valid
		    end
    	end
    end



    describe 'Messageバリデーションのテスト' do
        context 'contentカラム' do
		    it '空欄でないこと' do
		      message.content = ''
		      expect(message.valid?).to eq false;
		    end
    	end
    end


    describe 'Messageアソシエーションのテスト' do
	  context 'ChatNoticeモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(Message.reflect_on_association(:chat_notices).macro).to eq :has_many
	    end
	  end
	  context 'Roomモデルとの関係' do
	    it 'N:1となっている' do
	      expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
	    end
	  end
	end

end


