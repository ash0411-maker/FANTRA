require 'rails_helper'



RSpec.describe TourGuide::ToursController, type: :system do
  let(:guide) { create(:guide) }



  describe 'Tour新規登録' do
    before do
      login guide
      visit new_tour_guide_guide_tour_path(guide.id)
    end
    context 'Tour新規登録' do
      it '新規登録に成功する' do
        fill_in "tour[title]", with: Faker::Lorem.characters(number:5)
        fill_in 'tour[body]', with: Faker::Lorem.characters(number:5)
        fill_in 'tour[meetingpoint_introduction]', with: Faker::Lorem.characters(number:5)
        fill_in 'tour[meetingpoint_address]', with: Faker::Lorem.characters(number:7)
        fill_in 'tour[capacity]', with: Faker::Address.full_address
        fill_in 'tour[price]', with: Faker::Number.number(digits:4)
        fill_in 'tour[contents_of_price]', with: Faker::Number.number(digits:4)
        fill_in 'tour[time]', with: Faker::Number.number(digits:4)
        click_button 'ツアー内容を保存'

        expect(page).to have_content 'ツアー内容'
      end

      it '新規登録に失敗する' do
        fill_in "tour[title]", with: ''
        fill_in 'tour[body]', with: ''
        fill_in 'tour[meetingpoint_introduction]', with: ''
        fill_in 'tour[meetingpoint_address]', with: ''
        fill_in 'tour[capacity]', with: ''
        fill_in 'tour[price]', with: ''
        fill_in 'tour[contents_of_price]', with: ''
        fill_in 'tour[time]', with: ''
        click_button 'ツアー内容を保存'

        expect(page).to have_content 'エラー'
      end
    end
  end
end