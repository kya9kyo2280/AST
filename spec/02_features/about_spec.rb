require 'rails_helper'
# config.active_support.deprecation = :silenceをconfigのtest.rbに付け加える必要がある
RSpec.feature "Homeページ、サインアップ、ログイン、ログアウトに関するテスト", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  feature "サインアップの確認" do
    before do
      visit new_user_registration_path
      find_field('user[name]').set("name_aws")
      find_field('user[email]').set("aa@aa")
      find_field('user[password]').set("pppppp")
      find_field('user[password_confirmation]').set("pppppp")
    end

    scenario "正しくサインアップできているか" do
      expect {
        find("input[name='commit']").click
      }.to change(User, :count).by(1)
    end

  end

  feature "ログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[email]').set(@user.email)
      find_field('user[password]').set(@user.password)
      find("input[name='commit']").click
    end
    scenario "正しくログインして、リダイレクトされているか" do
      expect(page).to have_current_path user_path(@user)
    end

  end

  feature "有効でない内容でのログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[email]').set(nil)
      find_field('user[password]').set(nil)
      find("input[name='commit']").click
    end
    scenario "リダイレクト先は正しいか" do
      expect(page).to have_current_path new_user_session_path
    end
  end

  feature "ログアウトの確認" do
    before do
      login(@user)
      visit user_path(@user)
      all("a[data-method='delete'][href='/users/sign_out']")[0].click
     # click_on "logout"
    end

  end

  feature "ヘッダーのリンクの確認" do
    scenario "ログイン時" do
      login(@user)
      visit root_path
      expect(page).to have_link "",href: user_path(@user)
      expect(page).to have_link "",href: users_path
      expect(page).to have_link "",href: studies_path
      expect(page).to have_link "",href: new_contact_path
      expect(page).to have_link "",href: destroy_user_session_path
    end
    scenario "ログアウト時" do
      visit root_path
      expect(page).to have_link "",href: root_path
      expect(page).to have_link "",href: about_path
      expect(page).to have_link "",href: new_user_session_path
      expect(page).to have_link "",href: new_user_registration_path
    end
  end
end

