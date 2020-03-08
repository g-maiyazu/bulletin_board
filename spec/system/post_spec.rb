require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  it '新規投稿したあと、その投稿を編集、削除する' do
    user = FactoryBot.create(:user, name: 'foobar', email: 'foobar@mail.com')

    # ログイン
    visit root_path

    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン状態を保持'

    fill_in 'メールアドレス', with: 'foobar@mail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログインする'
    expect(page).to have_content 'ログインしました。'

    # 新規投稿
    visit new_post_path

    expect(page).to have_content 'スレッド投稿'

    fill_in 'タイトルを入力...', with: '私が気になる1つ目のニュース'
    fill_in '記事内容を入力...', with: '人に感染する「コロナウイルス」は、７種類見つかっております'
    expect do
      click_button '投稿を送信'
    end.to change(Post, :count).by(1)

    expect(page).to have_content '投稿されました。'
    expect(current_path).to eq root_path

    post = Post.first
    visit post_path(post)
    expect(current_path).to eq post_path(post)
    expect(page).to have_content '私が気になる1つ目のニュース'
    expect(page).to have_content '人に感染する「コロナウイルス」は、７種類見つかっております'
  end
end
