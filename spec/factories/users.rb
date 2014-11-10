FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password_digest "MyString"
    access_token "MyString"
    token_scope "session"
    token_expired_at "2015-11-10 06:03:46"
    token_created_at "2014-11-10 06:03:46"
  end

end
