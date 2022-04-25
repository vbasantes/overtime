
require 'rails_helper'

describe 'navigate' do

  before do
    @user = User.create(email: "test6@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name:"Test", last_name:"Test")
    login_as(@user, :scope => :user)
    visit (new_post_path)
  end

  describe 'index' do

    before do
        visit posts_path
    end

    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of Posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1", user: @user)
      post2 = Post.create(date: Date.today, rationale: "Post2", user: @user)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end

  end

  describe 'creation' do

    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it "will have a user associated with post" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

end
