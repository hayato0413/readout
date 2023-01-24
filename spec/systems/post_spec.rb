require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user.id)
    sign_in @user
  end

  describe '投稿の作成' do
    it '正常に投稿を作成できること' do
      visit root_path
      within find("#readout", visible: false) do
        fill_in("post[title]", with: "テスト", visible: false)
        fill_in("post[content]", with: "テスト", visible: false)
        click_button("commit", visible: false)
      end
      expect(page).to have_content "投稿しました"
    end
  end

  describe '投稿の編集' do
    it '正常に投稿の編集ができること' do
      visit post_post_user_path(@user)
      find(".post__content-url").click
      find(".post_show-edit-btn").click
      within find(".readout-content") do
        fill_in "post[title]", with: 'テスト'
        fill_in "post[author]", with: 'テスト'
        fill_in "post[publish]", with: 'テスト'
        find('label[for=post_evaluation_5]').click
        fill_in "post[content]", with: "テスト"
        click_button("commit")
      end
      expect(page).to have_content '投稿を更新しました'
    end
  end

  describe '投稿の削除' do
    it "正常に投稿の削除ができること" do
      visit post_post_user_path(@user)
      find(".post__content-url").click
      find(".post_show-destroy-btn").click
      expect(page).to have_content "投稿を破棄しました"
    end
  end

  describe 'お気に入り' do
    before do
      visit post_post_user_path(@user)
      find(".post__content-url").click
    end

    context "お気に入りしてない時" do
      it "正常にお気に入りできること" do
        click_link "favorite-btn"
        expect(page).to have_content "投稿をお気に入りしました"
      end
    end

    context "お気に入りしている時" do
      it "正常にお気に入りを解除できること" do
        click_link "favorite-btn"
        click_link "favorite-btn"
        expect(page).to have_content "お気に入りを取り消しました"
      end
    end
  end

  describe 'カテゴリー検索' do
    before do
      FactoryBot.create(:post)
      @category = Category.first
    end

    it "正常にカテゴリー検索できること" do
      visit post_category_index_path
      first(".category_index__item").click
      within find(".post__category-section") do
        expect(page).to have_content @category.name
      end
    end
  end

  describe 'キーワード検索' do
    before do
      FactoryBot.create(:post, title: "テスト1")
      FactoryBot.create(:post, content: "テスト2")
      visit post_category_index_path
    end

    context "titleカラムの場合" do
      it "正常にキーワード検索ができること" do
        fill_in "keyword", with: "テスト1"
        click_button "commit"
        within find(".post__title") do
          expect(page).to have_content "テスト1"
        end
      end
    end

    context "contentカラムの場合" do
      it "正常にキーワード検索ができること" do
        fill_in "keyword", with: "テスト2"
        click_button "commit"
        within find(".post__review-section") do
          expect(page).to have_content "テスト2"
        end
      end
    end
  end

  describe 'ランキング' do
    before do
      @other_user1 = FactoryBot.create(:user)
      @other_user2 = FactoryBot.create(:user)
      @other_post1 = FactoryBot.create(:post, user_id: @user.id)
      @other_post2 = FactoryBot.create(:post, user_id: @user.id)

      FactoryBot.create(:favorite, post: @post, user: @user)
      FactoryBot.create(:favorite, post: @post, user: @other_user1)
      FactoryBot.create(:favorite, post: @post, user: @other_user2)

      FactoryBot.create(:favorite, post: @other_post1, user: @user)
      FactoryBot.create(:favorite, post: @other_post1, user: @other_user1)

      FactoryBot.create(:favorite, post: @other_post2, user: @user)
    end

    context "同率のお気に入り数がない場合" do
      before do
        visit post_lanking_path
      end

      it "一番上が1位であること" do
        within find(".lanking_box_1") do
          expect(page).to have_content "1位"
        end
      end
      it "二番目が2位であること" do
        within find(".lanking_box_2") do
          expect(page).to have_content "2位"
        end
      end
      it "三番目が3位であること" do
        within find(".lanking_box_3") do
          expect(page).to have_content "3位"
        end
      end
    end

    context "同率のお気に入り数がある場合" do
      before do
        FactoryBot.create(:favorite, post: @other_post1, user: @other_user2)
        visit post_lanking_path
      end

      it "同率の場合、二番目も1位であること" do
        within find(".lanking_box_2") do
          expect(page).to have_content "1位"
        end
      end
      it "上の位が同率の場合、間の順位を飛ばして位がついてること" do
        within find(".lanking_box_3") do
          expect(page).to have_content "3位"
        end
      end
    end
  end
end
