require 'rails_helper'



RSpec.describe Admin::CitiesController, type: :controller do
    let(:admin) { create(:admin) }
    let(:city) { create(:city) }


    describe '一覧ページ' do
      context "一覧ページが正しく表示される" do
        before do
          login_admin admin
          get :index
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it '都市一覧に都市名が表示される' do
          expect(page).to have_content(city.name)
        end
      end

      context "一覧ページが正しく表示されないこと" do
        before do
          get :index
        end
        it 'ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること' do
          expect(response.status).to eq 302
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
          login_tourist admin
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