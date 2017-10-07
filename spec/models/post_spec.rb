require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "creation" do
		before do
			@user = User.create(first_name:"rohan" , last_name:"arora" ,email:"rohan1@gmail.com" , password:"rohanarora" , password_confirmation:"rohanarora");
    		login_as(@user , :scope => :user)
			@post = Post.create(date: Date.today , rationale:"anything" , user_id: @user.id);
		end

		it "can be craeted" do
			expect(@post).to be_valid
		end

		it "cannot be created without dates and rationale" do
			@post.date = nil;
			@post.rationale = nil;
			expect(@post).to_not be_valid
		end

	end
end
