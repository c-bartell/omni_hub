FactoryBot.define do
  factory :user do
    username { 'c-bartell' }
    uid { '60277914' }
    token { ENV['ACCESS_TOKEN'] }
  end
end
