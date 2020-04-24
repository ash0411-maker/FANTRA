require 'rails_helper'


RSpec.describe ChatNotice, type: :model do
	let(:message) { create(:message) }
	let(:room) { create(:room) }
	let(:guide_visitor) { create(:guide) }
	let(:guide_visited) { create(:guide) }
	let(:tourist_visitor) { create(:tourist) }
	let(:tourist_visited) { create(:tourist) }
	let!(:chat_notice) { build(:chat_notice, message_id: message.id, visited_id: tourist_visited.id, visitor_id: guide_visitor.id) }


	describe 'ChatNotice保存テスト' do
        context 'チャット通知が正しく保存される' do
		    it '全て入力されているので保存' do
		      expect(chat_notice).to be_valid
		    end
    	end
    end



    describe 'ChatNoticeアソシエーションのテスト' do
	  context 'Tourist_visitorモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(ChatNotice.reflect_on_association(:tourist_visitor).macro).to eq :belongs_to
	    end
	  end
	  context 'Tourist_visitedモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(ChatNotice.reflect_on_association(:tourist_visited).macro).to eq :belongs_to
	    end
	  end
	  context 'Guide_visitorモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(ChatNotice.reflect_on_association(:guide_visitor).macro).to eq :belongs_to
	    end
	  end
	  context 'Guide_visitedモデルとの関係' do
	    it '1:Nとなっている' do
	      expect(ChatNotice.reflect_on_association(:guide_visited).macro).to eq :belongs_to
	    end
	  end
	end


end
