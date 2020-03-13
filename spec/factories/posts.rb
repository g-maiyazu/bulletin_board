FactoryBot.define do
  factory :post do
    title { '見出し' }
    caption { '記事内容' }
    association :user
  end
end
