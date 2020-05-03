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
end



