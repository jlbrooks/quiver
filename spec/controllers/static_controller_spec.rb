require 'rails_helper'

RSpec.describe StaticController, :type => :controller do
  before do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)

    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET /home" do
    it "should grab recent posts" do
      sign_in nil
      get :home
      expect(assigns(:posts)).to eq([@post])
    end

    it "should render the home page" do
      sign_in nil
      get :home
      expect(response).to render_template :home
    end
  end
end
