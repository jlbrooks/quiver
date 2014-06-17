require 'rails_helper'

RSpec.describe Group, :type => :model do
  before do
    @group = FactoryGirl.create(:group)
    @name = FactoryGirl.create(:name)
  end

  it "should have a valid factory" do
  	expect(@ngroup).to be_valid
  end
    it "should be invalid without a name" do
  	@name = nil
    expect(@name).not_to be_valid
  end	
end
