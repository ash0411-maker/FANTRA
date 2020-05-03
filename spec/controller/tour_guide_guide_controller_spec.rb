require 'rails_helper'



RSpec.describe TourGuide::GuidesController, type: :controller do
  let(:guide) { create(:guide) }




  describe 'ガイド詳細ページ' do
    context "ガイド詳細ページが正しく表示される" do
      before do
        login guide
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
        login guide
        get :edit, params: {id: guide.id}
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
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
        login guide
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
        login guide
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





