require 'rails_helper'

RSpec.describe Admin::CitiesController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:city) { create(:city) }


  describe '一覧ページ' do
    context "一覧ページが正しく表示される" do
      before do
        login admin
      end
      it 'リクエストは200 OKとなること' do
        visit admin_cities_path
        expect(response.status).to eq 200
      end
    end

    context "一覧ページが正しく表示されないこと" do
      before do
        visit admin_cities_path
      end
      it 'ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること' do
        expect(page).to have_current_path new_admin_session_path
      end
    end
  end


  describe 'データの保存' do
    context "cityが正しく保存される" do
      before do
        login admin
      end
      it "name" do
        expect {
        post :create, params: {
          city: {
            name: "京都",
          }
        }
      }.to change(City, :count).by(1)
      end
    end
    context "cityが正しく保存されない" do
      before do
        login admin
      end
      it "name" do
        expect {
        post :create, params: {
          city: {
            name: "",
          }
        }
      }.to change(City, :count).by(0)
      end
    end
  end
end
