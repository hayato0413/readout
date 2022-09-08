FactoryBot.define do
  factory :post do
    id          { 1 }
    title       {'テスト'}
    content     {'テスト'}
    author      {'テスト'}
    publish     {'テスト'}
    evaluation  { 1 }
    association :user
  end
end
