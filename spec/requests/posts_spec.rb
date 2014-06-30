require 'rails_helper'
require 'spec_helper'

RSpec.describe "Posts", :type => :request do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:long_post, user: @user)
  end

  describe "Manage posts" do
    describe "When not signed in" do
      it "Should not be able to make a new post" do
        visit root_path
        page.should_not have_content "New Post"
      end
    end

    describe "When signed in" do
      before do
        sign_in_user
      end

      it "should be able to make a new post" do
        visit posts_path
        page.should have_content "New Post"
      end

      it "should add a new post and display the info" do
        visit posts_path
        expect {
          click_link "New Post"
          fill_in "Title", with: "Yay"
          fill_in "post[body]", with: "stuff stuff"
          click_button "Create Post"
        }.to change(Post, :count).by(1)
        page.should have_content "Post was successfully created"
        page.should have_content "Yay"
        page.should have_content "stuff stuff"
      end

      it "should show excerpts of post bodies" do
        visit posts_path
        page.should have_content "Long Post"
        page.should have_content "A test or examination"
        page.should_not have_content "FOOBAR"
      end

      it "should show the whole post body on the show page" do
        visit posts_path
        click_link "Long Post"
        page.should have_content "Long Post"
        page.should have_content "FOOBAR"
      end
    end
  end

  def sign_in_user
    visit new_user_session_path
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end
end