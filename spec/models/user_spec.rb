require 'rails_helper'

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build_stubbed(:user)).to be_valid
  end

  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password digest" do
    user = FactoryGirl.build(:user, password_digest: nil)
    user.valid?
    expect(user.errors[:password_digest]).to include("can't be blank")
  end

  it "is invalid without an access token" do
    user = FactoryGirl.build(:user, access_token: nil)
    user.valid?
    expect(user.errors[:access_token]).to include("can't be blank")
  end

  it "is invalid without a token scope" do
    user = FactoryGirl.build(:user, token_scope: nil)
    user.valid?
    expect(user.errors[:token_scope]).to include("can't be blank")
  end

  it "is invalid without a token expired at" do
    user = FactoryGirl.build(:user, token_expired_at: nil)
    user.valid?
    expect(user.errors[:token_expired_at]).to include("can't be blank")
  end

  it "is invalid without a token created at" do
    user = FactoryGirl.build(:user, token_created_at: nil)
    user.valid?
    expect(user.errors[:token_created_at]).to include("can't be blank")
  end


end
