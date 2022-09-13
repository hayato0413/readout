require 'rails_helper'

RSpec.describe "Favorites", type: :request do 
  before do 
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
  end
  describe 'POST #create' do 
    context 'ログインしている場合' do 
      it '正常にデータを保存できること' do 
        sign_in @user
        post "/post/#{@post.id}/favorites"
        expect(flash[:notice]).to be_present
      end
    end
    context 'ログインしていない場合' do 
      it 'データを保存できないこと' do 
        post "/post/#{@post.id}/favorites"
        expect(flash[:alert]).to be_present
      end
    end
  end
  describe 'DELETE #destroy' do 
    before do 
      FactoryBot.create(:favorite, user_id: @user.id, post_id: @post.id)
    end
    context 'ログインしている場合' do 
      it '正常にデータを保存できること' do 
        sign_in @user
        delete "/post/#{@post.id}/favorites"
        expect(flash[:notice]).to be_present
      end
    end
    context 'ログインしていない場合' do 
      it 'データを保存できないこと' do 
        delete "/post/#{@post.id}/favorites"
        expect(flash[:alert]).to be_present
      end
    end
  end
end
