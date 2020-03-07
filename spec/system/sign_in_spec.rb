require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  it 'ログインできること' do
    FactoryBot.create(:user,
                      email: 'foobar@example.com',
                      password: 'password')

    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    # ログインできることを確認
    fill_in 'メールアドレス', with: 'foobar@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'

    expect(page).to have_content 'ログインしました。'
  end
end
