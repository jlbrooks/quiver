require 'rails_helper'

RSpec.describe Post, :type => :model do
  before do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
    @post.user = @user
  end

  it "should have a valid factory" do
    expect(@post).to be_valid
  end
  it "should be invalid without a title" do
    @post.title = nil
    expect(@post).to_not be_valid
  end
  it "should be invalid without a body" do
    @post.body = nil
    expect(@post).to_not be_valid
  end

  it "should be valid to make another one with the same title" do
    expect(FactoryGirl.create(:post)).to be_valid
  end

  it "should have a user" do
    expect(@post.user).to eq(@user)
  end
end
