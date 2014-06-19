require 'rails_helper'

RSpec.describe Comment, :type => :model do
	before do
		@comment = FactoryGirl.create(:comment)
		@post = FactoryGirl.create(:post)
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
end
