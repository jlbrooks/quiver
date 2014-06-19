require 'rails_helper'

RSpec.describe Group, :type => :model do
  before do
    @group = FactoryGirl.create(:group)
    @user = FactoryGirl.create(:user)
    @group.users << @user
  end

  it "should have a valid factory" do
  	expect(@group).to be_valid
  end
    it "should be invalid without a name" do
  	@group.name = nil
    expect(@group).not_to be_valid
  end	
   it "should allow multiple users in the same group" do
    @group.users<<(FactoryGirl.build(:user, :email => "test@user.com"))
    expect(@group.users.size).to eq(2)
  end
  xit "should need a user in the group" do
    @group.users = nil
    expect(@group).not_to be_valid
  end
end
