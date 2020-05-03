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
end





