require 'rails_helper'

RSpec.describe Post, :type => :model do
  before do
    @post = FactoryGirl.create(:post)
  end

  it "should have a valid factory" do
    @post.should be_valid
  end
  it "should be invalid without a title" do
    @post.title = nil
    @post.should_not be_valid
  end
  it "should be invalid without a body" do
    @post.body = nil
    @post.should_not be_valid
  end

  it "should be valid to make another one with the same title" do
    FactoryGirl.create(:post).should be_valid
  end
end
