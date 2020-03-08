FactoryBot.define do
  factory :comment do
    content { 'いい記事ですね' }

    association :post
    association :user
  end
end
