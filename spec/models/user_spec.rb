require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデルのバリデーション' do

    before do 
      @user = FactoryBot.build(:user)
    end

    describe 'Userモデルの初期インスタンス' do
      it 'バリデーションエラーがないこと' do 
        expect(@user).to be_valid
      end
    end

    describe 'ネームカラム' do
      it '31文字以上でバリデーションエラーが出ること' do
        @user.name = ('a' * 31)
        @user.valid?
        expect(@user.errors.full_messages).to include 'ユーザー名は30文字以内で入力してください'
      end
    end
    
    describe 'プロファイルカラム' do 
      it '121文字以上でバリデーションエラーが出ること' do 
        @user.profile = ('a' * 121)
        @user.valid?
        expect(@user.errors.full_messages).to include '自己紹介は120文字以内で入力してください'
      end
    end
  end
end
