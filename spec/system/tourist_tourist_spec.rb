require 'rails_helper'



RSpec.describe Tourist::TouristsController, type: :system do
  let(:tourist) { create(:tourist) }




  describe 'Tourist新規登録' do
    before do
      visit new_tourist_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'tourist[name]', with: Faker::Name.first_name
        fill_in 'tourist[family_name]', with: Faker::Name.last_name
        select '男性', from: 'tourist[sex]'
        fill_in 'tourist[nationality]', with: Faker::Lorem.characters(number:5)
        fill_in 'tourist[postal_code]', with: Faker::Lorem.characters(number:7)
        fill_in 'tourist[address]', with: Faker::Address.full_address
        fill_in 'tourist[phone_number]', with: Faker::PhoneNumber
        fill_in 'tourist[birth_year]', with: Faker::Number.number(digits:4)
        fill_in 'tourist[email]', with: Faker::Internet.email
        fill_in 'tourist[password]', with: 'password'
        fill_in 'tourist[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content 'さんのマイページ'
      end

      it '新規登録に失敗する' do
        fill_in 'tourist[name]', with: ''
        fill_in 'tourist[family_name]', with: ''
        select '性別', from: 'tourist[sex]'
        fill_in 'tourist[nationality]', with: ''
        fill_in 'tourist[postal_code]', with: ''
        fill_in 'tourist[address]', with: ''
        fill_in 'tourist[phone_number]', with: ''
        fill_in 'tourist[birth_year]', with: ''
        fill_in 'tourist[email]', with: ''
        fill_in 'tourist[password]', with: ''
        fill_in 'tourist[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content 'error'
      end
    end
  end



  describe 'Touristログイン' do
    let(:tourist) { create(:tourist) }
    before do
      visit new_tourist_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_tourist) { tourist }
      it 'ログインに成功する' do
        fill_in 'tourist[email]', with: test_tourist.email
        fill_in 'tourist[password]', with: test_tourist.password
        click_button 'ログイン'

        expect(page).to have_content 'さんのマイページ'
      end

      it 'ログインに失敗する' do
        fill_in 'tourist[email]', with: ''
        fill_in 'tourist[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_tourist_session_path)
      end
    end
  end





  # describe '詳細ページ' do
  #   context "詳細ページが正しく表示される" do
  #     before do
  #       login tourist
  #       get :show, params: {id: tourist.id}
  #     end
  #     it 'リクエストは200となること' do
  #       expect(response.status).to eq 200
  #     end
  #   end

  #   context "ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること" do
  #     before do
  #       get :show, params: {id: tourist.id}
  #     end
  #     it 'リクエストは302となること' do
  #       expect(response).to redirect_to "/tourists/sign_in"
  #     end
  #   end
  # end





  # describe 'Tourist編集ページ' do
  #   context "Tourist編集ページが正しく表示される" do
  #     before do
  #       login tourist
  #       get :edit, params: {id: tourist.id}
  #     end
  #     it 'リクエストは200 OKとなること' do
  #       expect(response.status).to eq 200
  #     end
  #   end

  #   context "ログイン無しだとTourist編集ページが表示されず、ログイン画面に遷移すること" do
  #     before do
  #       get :edit, params: {id: tourist.id}
  #     end
  #     it 'ログイン画面に遷移すること' do
  #       expect(response).to redirect_to "/tourists/sign_in"
  #     end
  #   end

  #   context "Tourist情報が正しく更新されること" do
  #     before do
  #       login tourist
  #     end
  #     it "name" do
  #       tourist_params = {
  #         name: "花子",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.name).to eq "花子"
  #     end
  #     it "family_name" do
  #       tourist_params = {
  #         family_name: "山田",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.family_name).to eq "山田"
  #     end
  #   end
  # end






  # describe 'Tourist情報更新' do
  #   context "Tourist情報が正しく更新されること" do
  #     before do
  #       login tourist
  #     end
  #     it "name" do
  #       tourist_params = {
  #         name: "花子",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.name).to eq "花子"
  #     end
  #     it "family_name" do
  #       tourist_params = {
  #         family_name: "山田",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.family_name).to eq "山田"
  #     end
  #     it "family_name" do
  #       tourist_params = {
  #         sex: "男性",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.sex).to eq "男性"
  #     end
  #     it "birth_year" do
  #       tourist_params = {
  #         birth_year: 1995,
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.birth_year).to eq 1995
  #     end
  #     it "phone_number" do
  #       tourist_params = {
  #         phone_number: "080-1234-1234",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.phone_number).to eq "080-1234-1234"
  #     end
  #     it "email" do
  #       tourist_params = {
  #         email: "a@a",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(tourist.reload.email).to eq "a@a"
  #     end
  #   end

  #   context "Tourist情報が正しく更新されず、編集画面にrenderすること" do
  #     before do
  #       login tourist
  #     end
  #     it "name" do
  #       tourist_params = {
  #         name: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #     it "family_name" do
  #       tourist_params = {
  #         family_name: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #     it "sex" do
  #       tourist_params = {
  #         sex: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #     it "birth_year" do
  #       tourist_params = {
  #         birth_year: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #     it "phone_number" do
  #       tourist_params = {
  #         phone_number: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #     it "email" do
  #       tourist_params = {
  #         email: "",
  #       }
  #       patch :update, params: {id: tourist, tourist: tourist_params}
  #       expect(response).to render_template(:edit)
  #     end
  #   end
  # end
end





