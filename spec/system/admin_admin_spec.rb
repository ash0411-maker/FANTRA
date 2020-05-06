require 'rails_helper'



RSpec.describe Admins::SessionsController, type: :system do


  describe 'adminログイン' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_admin) { admin }
      it 'ログインに成功する' do
        fill_in 'admin[email]', with: test_admin.email
        fill_in 'admin[password]', with: test_admin.password
        click_button 'ログイン'

        expect(page).to have_content '管理者トップ画面'
      end

      it 'ログインに失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_admin_session_path)
      end
    end
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_user_path(user)
        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_user_path(test_user2)
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end

    # context '表示の確認' do
    #   before do
    #     visit edit_user_path(user)
    #   end
    #   it 'User infoと表示される' do
    #     expect(page).to have_content('User info')
    #   end
    #   it '名前編集フォームに自分の名前が表示される' do
    #     expect(page).to have_field 'user[name]', with: user.name
    #   end
    #   it '画像編集フォームが表示される' do
    #     expect(page).to have_field 'user[profile_image]'
    #   end
    #   it '自己紹介編集フォームに自分の自己紹介が表示される' do
    #     expect(page).to have_field 'user[introduction]', with: user.introduction
    #   end
    #   it '編集に成功する' do
    #     click_button 'Update User'
    #     expect(page).to have_content 'successfully'
    #     expect(current_path).to eq('/users/' + user.id.to_s)
    #   end
    #   it '編集に失敗する' do
    #     fill_in 'user[name]', with: ''
    #     click_button 'Update User'
    #     expect(page).to have_content 'error'
    #     #もう少し詳細にエラー文出したい
    #     expect(current_path).to eq('/users/' + user.id.to_s)
    #   end
    # end
  end
end



