require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST sessions#guest_sign_in' do
    it 'ゲストユーザーとしてログインできること' do
      post '/guest_sign_in'
      expect(flash[:notice]).to be_present
    end
  end
end
