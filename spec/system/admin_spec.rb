require 'rails_helper'
RSpec.describe 'Bookに関するテスト', type: :system do
    let(:admin) { create(:admin) }
    let!(:city) { create(:city) }
    describe '一覧ページ' do
      context "一覧ページが正しく表示される" do
        before do
          login admin
        end
        it '都市一覧に都市名が表示される' do
          visit admin_cities_path
          #Rails.logger.debug 'fantra'
          #Rails.logger.debug city.name
          expect(page).to have_content(city.name)
        end
      end
    end
end
