require 'rails_helper'

RSpec.describe 'static_pages', type: :request do
  describe 'GET /' do
    it '正しいレスポンスが確認されること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
