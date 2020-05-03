require 'rails_helper'



RSpec.describe TourGuide::GuidesController, type: :system do
  let(:guide) { create(:guide) }



  describe 'Guide新規登録' do
    before do
      visit new_guide_registration_path
    end
    context '新規登録画面' do
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




  describe 'Guideログイン' do
    let(:guide) { create(:guide) }
    before do
      visit new_guide_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_guide) { guide }
      it 'ログインに成功する' do
        fill_in 'guide[email]', with: test_guide.email
        fill_in 'guide[password]', with: test_guide.password
        click_button 'ログイン'

        expect(page).to have_content '本日に入った予約件数は'
      end

      it 'ログインに失敗する' do
        fill_in 'guide[email]', with: ''
        fill_in 'guide[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_guide_session_path)
      end
    end
  end
end



