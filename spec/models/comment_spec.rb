require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.create(:comment, :post => @post, :user => @user)
  end

 it "should have a valid factory" do
  expect(@comment).to be_valid
 end

 it "should be invalid without a body" do
  @comment.body = nil
  expect(@comment).to_not be_valid
 end

 it "should be invalid wihtout a post" do
  @comment.post = nil
  expect(@comment).to_not be_valid
 end

 it "should have a user" do
  expect(@comment.user).to eq(@user)
 end
end