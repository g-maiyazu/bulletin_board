require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    it 'ページタイトルが無い場合、サイト名だけを返すこと' do
      expect(full_title).to eq 'BulletinBoard'
    end

    it 'ページタイトルがある場合、完全なタイトルを返すこと ' do
      expect(full_title('Test')).to eq 'Test | BulletinBoard'
    end
  end
end
