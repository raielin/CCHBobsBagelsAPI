FactoryGirl.define do
  sequence :access_token do |n|
    "#{n}"
  end
  sequence :password_digest do |n|
    "#{n}"
  end
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    sequence (:email)
    sequence (:password_digest)
    sequence (:access_token)
    token_scope "session"
    token_expired_at "2015-11-10 06:03:46"
    token_created_at "2014-11-10 06:03:46"
  end

end
