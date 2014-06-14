require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @post.user = @user
    @user.posts<<(@post)
  end

  it "should have a valid factory" do
    expect(@user).to be_valid
  end

  it "should not be valid without an email" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "should not allow duplicate emails" do
    expect(FactoryGirl.build(:user)).not_to be_valid
  end

  it "should be able to access a post" do
    expect(@user.posts).not_to be_empty
  end

  it "should be able to have multiple posts" do
    @user.posts<<(FactoryGirl.create(:post, title: "other post"))
    expect(@user.posts.size).to eq(2)
  end
end
