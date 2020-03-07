require 'rails_helper'

RSpec.describe 'Edit user', type: :system do
  it 'プロフィールを編集する' do
    user = FactoryBot.create(:user, email: 'foobar@mail.com', password: 'password', password: 'password')

    # ログイン
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foobar@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'ログインしました。'

    # プロフィールを編集する
    visit user_path(user)

    click_link 'プロフィール編集'
    expect(current_path).to eq edit_user_path
    expect(page).to have_content 'アカウント設定'

    fill_in 'ユーザーネーム', with: 'テストユーザー'
    fill_in 'メールアドレス', with: 'foobar@example.com'
    fill_in '自己紹介', with: 'いい記事が見たい'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    fill_in '現在のパスワード', with: 'password'

    click_button '変更を保存する'

    expect(current_path).to eq user_path(user)
    expect(page).to have_content 'アカウント情報を変更しました。'
  end
end
