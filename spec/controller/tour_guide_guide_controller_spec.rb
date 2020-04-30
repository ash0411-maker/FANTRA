require 'rails_helper'



RSpec.describe TourGuide::GuidesController, type: :controller do
  let(:guide) { create(:guide) }



  describe 'ユーザー新規登録' do
    before do
      visit new_guide_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'guide[name]', with: Faker::Name.first_name
        fill_in 'guide[family_name]', with: Faker::Name.last_name
        fill_in 'guide[nationality]', with: Faker::Lorem.characters(number:5)
        fill_in 'guide[postal_code]', with: Faker::Lorem.characters(number:7)
        fill_in 'guide[address]', with: Faker::Address.full_address
        fill_in 'guide[phone_number]', with: Faker::PhoneNumber
        attach_file 'guide[selfy_image]', "app/assets/images/no_image.jpg"
        attach_file 'guide[identification_image]', "app/assets/images/no_image.jpg"
        fill_in 'guide[email]', with: Faker::Internet.email
        fill_in 'guide[password]', with: 'password'
        fill_in 'guide[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content '本日に入った予約件数は'
      end

      it '新規登録に失敗する' do
        fill_in 'guide[name]', with: ''
        fill_in 'guide[family_name]', with: ''
        fill_in 'guide[nationality]', with: ''
        fill_in 'guide[postal_code]', with: ''
        fill_in 'guide[address]', with: ''
        fill_in 'guide[phone_number]', with: ''
        fill_in 'guide[email]', with: ''
        fill_in 'guide[password]', with: ''
        fill_in 'guide[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content 'error'
      end
    end
  end





  describe 'ガイド詳細ページ' do
    context "ガイド詳細ページが正しく表示される" do
      before do
        login_guide guide
        get :show, params: {id: guide.id}
      end
      it 'リクエストは200となること' do
        expect(response.status).to eq 200
      end
    end

    context "ログイン無しだとガイド詳細ページが表示されず、ログイン画面に遷移すること" do
      before do
        get :show, params: {id: guide.id}
      end
      it 'ログイン画面に遷移すること' do
        expect(response).to redirect_to "/guides/sign_in"
      end
    end
  end





  describe 'Guide編集ページ' do
    context "Guide編集ページが正しく表示される" do
      before do
        login_guide guide
        get :edit, params: {id: guide.id}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "ログイン無しだとGuide編集ページが表示されず、ログイン画面に遷移すること" do
      before do
        get :edit, params: {id: guide.id}
      end
      it 'ログイン画面に遷移すること' do
        expect(response).to redirect_to "/guides/sign_in"
      end
    end
  end






  describe 'Guide情報更新' do
    context "Guide情報が正しく更新されること" do
      before do
        login_guide guide
      end
      it "name" do
        guide_params = {
          name: "花子",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(guide.reload.name).to eq "花子"
      end
      it "family_name" do
        guide_params = {
          family_name: "山田",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(guide.reload.family_name).to eq "山田"
      end
      it "phone_number" do
        guide_params = {
          phone_number: "080-1234-1234",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(guide.reload.phone_number).to eq "080-1234-1234"
      end
      it "email" do
        guide_params = {
          email: "a@a",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(guide.reload.email).to eq "a@a"
      end
    end

    context "Guide情報が正しく更新されず、編集画面にrenderすること" do
      before do
        login_guide guide
      end
      it "name" do
        guide_params = {
          name: "",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(response).to render_template(:edit)
      end
      it "family_name" do
        guide_params = {
          family_name: "",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(response).to render_template(:edit)
      end
      it "phone_number" do
        guide_params = {
          phone_number: "",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(response).to render_template(:edit)
      end
      it "email" do
        guide_params = {
          email: "",
        }
        patch :update, params: {id: guide, guide: guide_params}
        expect(response).to render_template(:edit)
      end
    end
  end


end





