require 'rails_helper'


RSpec.describe 'Cityに関するテスト', type: :system do
  let(:admin) { create(:admin) }
  let!(:city) { create(:city) }



  describe '一覧ページ' do
    context "一覧ページが正しく表示される" do
      before do
        login admin
      end
      it '都市一覧に都市名が表示される' do
        visit admin_cities_path
        expect(page).to have_content(city.name)
      end
    end
  end

  describe 'City新規登録' do
    before do
      login admin
      visit admin_cities_path
    end
    context '新規登録画面' do
      it '新規登録に成功する' do
        fill_in 'city[name]', with: Faker::Name.first_name
        click_button '追加'

        expect(page).to have_content '新たな都市を追加しました'
      end

      it '新規登録に失敗する' do
        fill_in 'city[name]', with: ''
        click_button '追加'

        expect(page).to have_content '件のエラーがあります'
      end
    end
  end



  describe 'Cityページのテスト' do
    context '自分の編集画面への遷移' do
      before do
        login admin
        visit admin_cities_path
      end
      it '遷移できる' do
        expect(current_path).to eq('/admin/cities')
      end
    end
    context '他人の編集画面への遷移' do
      before do
        visit admin_cities_path
      end
      it '遷移できない' do
        expect(current_path).to eq('/admins/sign_in')
      end
    end
  end
end
