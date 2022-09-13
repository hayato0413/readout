require 'rails_helper'

RSpec.describe "Posts", type: :request do 
  before do 
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
  end 

  describe 'GET #index' do 
    context 'ログインしている場合' do
      it '正常にページが開けること' do 
        sign_in @user
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do
      it '正常にページが開けること' do 
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do 
    context 'ログインしている場合' do 
      it '正常にページが開けること' do 
        sign_in @user
        get post_path(@post)
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do 
      it '正常にページが開けること' do 
        get post_path(@post)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #search' do 
    context 'ログインしている場合' do 
      it '正常にページが開けること' do 
        sign_in @user
        get post_search_path
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do 
      it '正常にページが開けること' do 
        get post_search_path
        expect(response).to have_http_status(:success)
      end
    end 
  end

  describe 'GET #category' do 
    before do 
      @category = Category.first
    end
    context 'ログインしている場合' do 
      it '正常にページが開けること' do 
        sign_in @user
        get  post_category_path(@category.id)
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do 
      it '正常にページが開けること' do 
        get  post_category_path(@category.id)
        expect(response).to have_http_status(:success)
      end
    end 
  end

  describe 'GET #edit' do 
    context 'ログインしている場合' do 
      it '正常にページが開けること' do 
        sign_in @user
        get edit_post_path(@post)
        expect(response).to have_http_status(:success)
      end    
    end
    context 'ログインしていない場合' do 
      it 'リダイレクトされること' do 
        get edit_post_path(@post)
        expect(response).to have_http_status 302
      end
    end
  end

  describe 'GET #favorite' do 
    before do 
      FactoryBot.create(:favorite, post_id: @post.id, user_id: @user.id)
    end
    context 'ログインしている場合' do 
      it '正常にページが開けること' do 
        sign_in @user
        get post_favorite_path(@user)
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do 
      it 'リダイレクトされること' do 
        get post_favorite_path(@user)
        expect(response).to have_http_status 302
      end
    end
  end

  describe 'GET #post_user' do 
    context 'ログインしている場合' do 
      it '正常にページが開けること' do
        sign_in @user 
        get post_post_user_path(@user)
        expect(response).to have_http_status(:success)
      end
    end
    context 'ログインしていない場合' do 
      it 'リダイレクトされること' do 
        get post_post_user_path(@user)
        expect(response).to have_http_status 302
      end
    end
  end

  describe 'POST #create' do 
    context 'ログインしている場合' do
      it '正常に投稿を保存できること' do
        sign_in @user
        @post_params = FactoryBot.attributes_for(:post)
        post "/post", params: {post: @post_params}
        expect(flash[:notice]).to be_present
      end
    end
    context 'ログインしていない場合' do
      it '投稿を保存できないこと' do
        @post_params = FactoryBot.attributes_for(:post)
        post "/post", params: {post: @post_params}
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'PATCH PUT #update' do 
    context 'ログインしている場合' do 
      it '正常に投稿を保存できること' do 
        sign_in @user
        put "/post/#{@post.id}", params: { post: { title: "アップデート" } }
        expect(@post.reload.title).to eq "アップデート"
      end
    end
    context 'ログインしていない場合' do 
      it '投稿を保存できないこと' do 
        put "/post/#{@post.id}", params: { post: { title: "アップデート" } }
        expect(@post.reload.title).not_to eq "アップデート"
      end
    end
  end

  describe 'DELETE #destroy' do 
    context 'ログインしている場合' do 
      it '正常に投稿を削除できること' do 
        sign_in @user
        delete "/post/#{@post.id}"
        expect(flash[:notice]).to be_present
      end
    end
    context 'ログインしていない場合' do 
      it '投稿を削除できないこと' do 
        delete "/post/#{@post.id}"
        expect(flash[:alert]).to be_present
      end
    end
  end
end
