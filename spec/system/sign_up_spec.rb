require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  it '新規登録できること' do
    visit signup_path
    expect(page).to have_content '新規登録'
    expect(current_path).to eq signup_path

    # 登録に失敗する場合
    fill_in 'メールアドレス', with: 'sample@invalid'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード確認', with: 'abcdef'

    click_button '新規登録'
    expect(page).to have_content 'メールアドレスは不正な値です'
    expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'

    # 登録に成功する場合
    fill_in 'メールアドレス', with: 'foobar@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    expect do
      click_button '新規登録'
    end.to change(User, :count).by(1)

    expect(current_path).to eq root_path
    expect(page).to have_content 'アカウント登録が完了しました。'
  end
end
