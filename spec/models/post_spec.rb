require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション' do 

    before do 
      @post = FactoryBot.build(:post)
    end
    
    describe '初期インスタンス' do
      it 'バリデーションエラーがないこと' do 
        expect(@post).to be_valid
      end
    end

    describe 'タイトルカラム' do
      context '空の場合' do 
        it 'バリデーションエラーが出ること' do
          @post.title = ''
          @post.valid?
          expect(@post.errors.full_messages).to include "タイトルを入力してください"
        end
      end
      context '41文字以上の場合'do 
        it 'バリデーションエラーが出ること' do 
          @post.title = ('a' * 41)
          @post.valid?
          expect(@post.errors.full_messages).to include "タイトルは40文字以内で入力してください"
        end
      end
    end

    describe 'コンテンツカラム' do
      context '空の場合' do 
        it 'バリデーションエラーが出ること' do
          @post.content = ''
          @post.valid?
          expect(@post.errors.full_messages).to include "レビューを入力してください"
        end
      end
      context '151文字以上の場合' do 
        it 'バリデーションエラーが出ること' do 
          @post.content = ('a' * 151)
          @post.valid?
          expect(@post.errors.full_messages).to include "レビューは150文字以内で入力してください"
        end
      end
    end

    describe 'アクターカラム' do
      it '21文字以上でバリデーションエラーが出ること' do
        @post.author = ('a' * 21)
        @post.valid?
        expect(@post.errors.full_messages).to include "著者は20文字以内で入力してください"
      end
    end

    describe 'パブリッシュカラム' do 
      it '21文字以上でバリデーションエラーが出ること' do 
        @post.publish = ('a' * 21)
        @post.valid?
        expect(@post.errors.full_messages).to include "出版社は20文字以内で入力してください"
      end
    end

    describe 'エバリュエーションカラム' do 
      context '空の場合' do 
        it 'バリデーションエラーが出ること'do 
          @post.evaluation = ''
          @post.valid?
          expect(@post.errors.full_messages).to include "評価を入力してください"
        end
      end
      context '値が0の場合' do 
        it 'バリデーションエラーが出ること'do 
          @post.evaluation = 0
          @post.valid?
          expect(@post.errors.full_messages).to include "評価は0より大きい値にしてください"
        end
      end
      context '値が6以上の場合' do 
        it 'バリデーションエラーが出ること'do 
          @post.evaluation = 6
          @post.valid?
          expect(@post.errors.full_messages).to include "評価は6より小さい値にしてください"
        end
      end
    end 

  end
end

