require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe "ユーザー作成" do
    it '正常にユーザーが作成できること' do
      visit root_path
      click_link "新規登録"
      within find(".account-content") do
        fill_in "user[name]", with: "ユーザーネーム"
        fill_in "user[email]", with: "test@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button "新規登録"
      end
      expect(page).to have_content "アカウント登録が完了しました"
    end
  end

  describe "ログイン" do
    before do
      FactoryBot.create(:user, email: "test@gmail.com")
    end

    it "正常にログインができること" do
      visit root_path
      click_link "ログイン"
      within find(".account-content") do
        fill_in "user[email]", with: "test@gmail.com"
        fill_in "user[password]", with: "password"
        click_button "commit"
      end
      expect(page).to have_content "ログインしました"
    end
  end

  describe "ログアウト" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "正常にログアウトできること" do
      visit root_path
      click_link "ログアウト"
      expect(page).to have_content "ログアウトしました"
    end
  end

  describe "アカウント編集" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "正常にアカウント編集ができること" do
      visit root_path
      click_link "アカウント編集"
      within find(".account-content") do
        fill_in "user[name]", with: "ユーザーネーム"
        fill_in "user[profile]", with: ""
        fill_in "user[email]", with: "test.@gmail.com"
        fill_in "user[password]", with: "newpassword"
        fill_in "user[password_confirmation]", with: "newpassword"
        fill_in "user[current_password]", with: "password"
        click_button "commit"
      end
      expect(page).to have_content "アカウント情報を変更しました"
    end
  end

  describe "ゲストログイン" do
    it 'ゲストユーザーとしてログインできること' do
      visit root_path
      click_link "新規登録"
      click_button "ゲストログイン"
      expect(page).to have_content "ゲストユーザーとしてログインしました"
    end
  end
end
