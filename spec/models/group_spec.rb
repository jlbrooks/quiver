require 'rails_helper'

RSpec.describe Group, :type => :model do
  it "should have a valid factory" do
  	FactoryGirl.create(:group).should be_valid
  end
  it "should be invalid without members" do
  	FactoryGirl.build(:group, :has_many_members => nil).should_not be_valid
  end
  it "should be invalid without a name" do
  	FactoryGirl.build(:group, :name => nil).should_not be_valid
  end	
  it "should be invalid without a unique group name" do
  	FactoryGirl.build(:group, :name => "test").should_not be_valid
  end
end
