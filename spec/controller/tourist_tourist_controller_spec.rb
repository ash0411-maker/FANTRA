require 'rails_helper'



RSpec.describe Tourist::TouristsController, type: :controller do
  let(:tourist) { create(:tourist) }





  describe '詳細ページ' do
    context "詳細ページが正しく表示される" do
      before do
        login tourist
        get :show, params: {id: tourist.id}
      end
      it 'リクエストは200となること' do
        expect(response.status).to eq 200
      end
    end

    context "ログイン無しだと詳細ページが表示されず、ログイン画面に遷移すること" do
      before do
        get :show, params: {id: tourist.id}
      end
      it 'リクエストは302となること' do
        expect(response).to redirect_to "/tourists/sign_in"
      end
    end
  end





  describe 'Tourist編集ページ' do
    context "Tourist編集ページが正しく表示される" do
      before do
        login tourist
        get :edit, params: {id: tourist.id}
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context "ログイン無しだとTourist編集ページが表示されず、ログイン画面に遷移すること" do
      before do
        get :edit, params: {id: tourist.id}
      end
      it 'ログイン画面に遷移すること' do
        expect(response).to redirect_to "/tourists/sign_in"
      end
    end

    context "Tourist情報が正しく更新されること" do
      before do
        login tourist
      end
      it "name" do
        tourist_params = {
          name: "花子",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.name).to eq "花子"
      end
      it "family_name" do
        tourist_params = {
          family_name: "山田",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.family_name).to eq "山田"
      end
    end
  end






  describe 'Tourist情報更新' do
    context "Tourist情報が正しく更新されること" do
      before do
        login tourist
      end
      it "name" do
        tourist_params = {
          name: "花子",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.name).to eq "花子"
      end
      it "family_name" do
        tourist_params = {
          family_name: "山田",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.family_name).to eq "山田"
      end
      it "sex" do
        tourist_params = {
          sex: "男性",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.sex).to eq "男性"
      end
      it "birth_year" do
        tourist_params = {
          birth_year: 1995,
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.birth_year).to eq 1995
      end
      it "phone_number" do
        tourist_params = {
          phone_number: "080-1234-1234",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.phone_number).to eq "080-1234-1234"
      end
      it "email" do
        tourist_params = {
          email: "a@a",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(tourist.reload.email).to eq "a@a"
      end
    end

    context "Tourist情報が正しく更新されず、編集画面にrenderすること" do
      before do
        login tourist
      end
      it "name" do
        tourist_params = {
          name: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
      it "family_name" do
        tourist_params = {
          family_name: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
      it "sex" do
        tourist_params = {
          sex: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
      it "birth_year" do
        tourist_params = {
          birth_year: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
      it "phone_number" do
        tourist_params = {
          phone_number: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
      it "email" do
        tourist_params = {
          email: "",
        }
        patch :update, params: {id: tourist, tourist: tourist_params}
        expect(response).to render_template(:edit)
      end
    end
  end


end





