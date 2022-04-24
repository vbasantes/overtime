require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do

    before do
      user = User.create(email: "test6@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name:"Test", last_name:"Test")
      @post = Post.create(date: Date.today, rationale: "Anything")
      @post.user = user
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
