require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Postモデルのバリデーション' do 

    before do 
      @post = FactoryBot.create(:post)
    end
    
    describe 'Postモデルの初期インスタンス' do
      it 'バリデーションエラーがないこと' do 
        expect(@post).to be_valid
      end
    end

    describe 'titleカラム' do
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

    describe 'contentカラム' do
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

    describe 'authorカラム' do
      it '21文字以上でバリデーションエラーが出ること' do
        @post.author = ('a' * 21)
        @post.valid?
        expect(@post.errors.full_messages).to include "著者は20文字以内で入力してください"
      end
    end

    describe 'publishカラム' do 
      it '21文字以上でバリデーションエラーが出ること' do 
        @post.publish = ('a' * 21)
        @post.valid?
        expect(@post.errors.full_messages).to include "出版社は20文字以内で入力してください"
      end
    end

    describe 'evaluationカラム' do 
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

    describe 'favorite?メソッド' do 
      before do 
        @favorite = FactoryBot.create(:favorite)
      end
      context 'Favoriteモデルに一致するuser_idがある場合' do 
        it 'trueを返すこと' do 
          @post2 = Post.find_by(id: @favorite.post_id)
          @user2 = User.find_by(id: @favorite.user_id)
          expect(@post2.favorite?(@user2)).to eq true
        end
      end
      context 'Favoriteモデルに一致するuser_idがない場合' do
        it 'falseを返すこと' do 
          @user = FactoryBot.build(:user)
          expect(@post.favorite?(@user)).to eq false
        end 
      end
    end

    describe 'searchメソッド' do 
      describe 'titleカラム' do 
        before do 
          @post2 = FactoryBot.create(:post, title: 'test')
          @keyword = "te"
        end 
        context 'keywordと一致するワードがある場合' do
          it 'Postモデルからそのデータが取得できていること' do
            @posts = Post.search(@keyword)
            expect(@posts[0].title).to eq 'test'
          end
        end
        context '引数と一致するワードがない場合' do 
          it 'Postモデルからそのデータが取得できていないこと' do
            @posts = Post.search('a')
            expect(@posts).to eq []
          end
        end
      end
      describe 'contentカラム' do 
        before do 
          @post2 = FactoryBot.create(:post, content: 'test')
          @keyword = "te"
        end 
        context 'keywordと一致するワードがある場合' do
          it 'Postモデルからそのデータが取得できていること' do
            @posts = Post.search(@keyword)
            expect(@posts[0].content).to eq 'test'
          end
        end
        context '引数と一致するワードがない場合' do 
          it 'Postモデルからそのデータが取得できていないこと' do
            @posts = Post.search('a')
            expect(@posts).to eq []
          end
        end
      end
    end

  end
end
