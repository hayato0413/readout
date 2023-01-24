require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe 'GET #show' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログインしている場合' do
      it '正常にページが開けること' do
        sign_in @user
        get account_path(@user)
        expect(response).to have_http_status(:success)
      end
    end

    context 'ログインしていない場合' do
      it 'リダイレクトされること' do
        get "/account/#{@user.id}"
        expect(response).to have_http_status 302
      end
    end
  end
end
