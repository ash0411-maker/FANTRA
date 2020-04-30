require 'rails_helper'



RSpec.describe TourGuide::ToursController, type: :controller do
  let(:guide) { create(:guide) }
  let(:genre) { create(:genre) }
  let(:city) { create(:city) }
  let!(:tour) { build(:tour, guide_id: guide.id, city_id: city.id,genre_id: genre.id) }



    describe 'Guide_Tour 一覧ページ' do
      context "一覧ページが正しく表示される" do
        before do
          login_guide guide
          get :index, params: {guide_id: guide.id}
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end

      context "Guide_Tour一覧ページが正しく表示されない" do
        before do
          get :index, params: {guide_id: guide.id}
        end
        it 'ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること' do
          expect(response.status).to eq 302
        end
      end
    end



    describe 'Guide_Tour 新規投稿ページ' do
      context "新規投稿ページが正しく表示される" do
        before do
          login_guide guide
          get :new, params: {guide_id: guide.id}
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end

      context "Guide_Tour一覧ページが正しく表示されない" do
        before do
          get :new, params: {guide_id: guide.id}
        end
        it 'ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること' do
          expect(response.status).to eq 302
        end
      end
    end




    describe 'Guide_Tour 新規投稿' do
      context "Tourが正しく保存される" do
        before do
          login_guide guide
        end
        it "Tourが正しく保存される" do
          expect {
          post :create, params: {
            guide_id: guide.id,
            tour: {
                guide_id:  Faker::Number.number(digits:2),
                city_id:  Faker::Number.number(digits:2),
                genre_id:  Faker::Number.number(digits:2),
                title: Faker::Lorem.characters(number:10),
                body: Faker::Lorem.characters(number:100),
                contents_of_price: Faker::Lorem.characters(number:50),
                capacity: Faker::Number.number(digits:2),
                time: Faker::Lorem.characters(number:5),
                price: Faker::Number.number(digits:10),
                is_active: Faker::Boolean.boolean,
                meetingpoint_address: Faker::Address.full_address,
                meetingpoint_introduction: Faker::Lorem.characters(number:5)
              }
            }
          }.to change(Tour, :count).by(1)
        end
      end
    end
end






















