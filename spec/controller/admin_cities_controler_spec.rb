require 'rails_helper'

RSpec.describe Admin::CitiesController, type: :controller do
#RSpec.describe 'Bookに関するテスト', type: :system do
    let!(:admin) { create(:admin) }
    let!(:city) { create(:city) }


    describe '一覧ページ' do
      context "一覧ページが正しく表示される" do
        before do
          login_admin admin
        end
        it 'リクエストは200 OKとなること' do
          visit admin_cities_path
          expect(response.status).to eq 200
        end
        it '都市一覧に都市名が表示される' do
          login_admin admin
          visit admin_cities_path
	  binding.pry
          #Rails.logger.debug 'fantra'
          #Rails.logger.debug city.name
          expect(page).to have_content(city.name)
        end
      end

      context "一覧ページが正しく表示されないこと" do
        before do
          visit admin_cities_path
        end
        it 'ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること' do
          #expect(response).to redirect_to "/admins/sign_in"
          expect(page).to have_current_path new_admin_session_path
        end
      end
    end


    describe 'データの保存' do
      context "cityが正しく保存される" do
        before do
          login_admin admin
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
          login_admin admin
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
