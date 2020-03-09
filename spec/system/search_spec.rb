require 'rails_helper'

RSpec.describe 'Search', type: :system do
  it '投稿を検索する' do
    foo = FactoryBot.create(:user, name: 'foo', email: 'foo@mail.com')
    post = FactoryBot.create(:post, title: 'ruby on rails', caption: '記事内容', user: foo)

    # fooでログインする
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foo@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(current_path).to eq root_path

    # タイトルを検索
    fill_in 'キーワードを検索...', with: 'ruby on rails'
    click_button 'searchbtn'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ruby on rails'

    # 内容を検索
    fill_in 'キーワードを検索...', with: '記事内容'
    click_button 'searchbtn'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ruby on rails'
  end
end
