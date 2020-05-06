require 'rails_helper'


RSpec.describe 'genreに関するテスト', type: :system do
  let(:admin) { create(:admin) }
  let!(:genre) { create(:genre) }



  describe '一覧ページ' do
    context "一覧ページが正しく表示される" do
      before do
        login admin
        visit admin_genres_path
      end
      it '都市一覧に都市名が表示される' do
        visit admin_genres_path
        expect(page).to have_content(genre.name)
      end
    end
  end

  describe 'Genre新規登録' do
    before do
      login admin
      visit admin_genres_path
    end
    context '新規登録画面' do
      it '新規登録に成功する' do
        fill_in 'genre[name]', with: Faker::Name.first_name
        click_button '追加'

        expect(page).to have_content 'ジャンルを追加しました。'
      end

      it '新規登録に失敗する' do
        fill_in 'genre[name]', with: ''
        click_button '追加'

        expect(page).to have_content '件のエラーがあります'
      end
    end
  end

  describe 'Genreページのテスト' do
    context 'Genreページへの遷移' do
      before do
        login admin
        visit admin_genres_path
      end
      it '遷移できる' do
        expect(current_path).to eq('/admin/genres')
      end
    end
    context 'ログイン無しでの遷移' do
      before do
        visit admin_genres_path
      end
      it '遷移できない' do
        expect(current_path).to eq('/admins/sign_in')
      end
    end
  end
end
