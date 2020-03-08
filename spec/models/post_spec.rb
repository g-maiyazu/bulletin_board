require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.create(:post) }

  it '有効なファクトリを持つこと' do
    expect(post).to be_valid
  end

  it 'ユーザー、タイトル、投稿内容があれば有効な状態であること' do
    user = FactoryBot.create(:user)
    post = Post.new(
      title: 'タイトル',
      caption: '記事内容',
      user: user
    )
    expect(post).to be_valid
  end

  describe '存在性の検証' do
    it 'タイトルがなければ無効な状態であること' do
      post.title = nil
      post.valid?
      expect(post.errors).to be_added(:title, :blank)
    end

    it '投稿内容がなければ無効な状態であること' do
      post.caption = nil
      post.valid?
      expect(post.errors).to be_added(:caption, :blank)
    end

    it 'ユーザーがなければ無効な状態であること' do
      post.user = nil
      post.valid?
      expect(post.errors).to be_added(:user, :blank)
    end
  end

  describe '文字数の検証' do
    it 'タイトルが20文字以内の場合、有効であること' do
      post.title = 'a' * 20
      expect(post).to be_valid
    end

    it 'タイトルが20文字を越える場合、無効であること' do
      post.title = 'a' * 21
      post.valid?
      expect(post.errors).to be_added(:title, :too_long, count: 20)
    end

    it 'キャプションが140文字以内の場合、有効であること' do
      post.caption = 'a' * 140
      expect(post).to be_valid
    end

    it 'キャプションが140文字を越える場合、無効であること' do
      post.caption = 'a' * 141
      post.valid?
      expect(post.errors).to be_added(:caption, :too_long, count: 140)
    end
  end
end
