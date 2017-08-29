require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do

  	before do
      user = User.create(email: "rohan@gmail.com" , password: "rohanarora" , password_confirmation: "rohanarora" , first_name: "rohan" , last_name: "arora")
      login_as(user , :scope => :user)
  		@post = Post.create(date: Date.today , rationale: "anything" , adjustment: "anybody" , Department: "ECE" , count: 1);
  	end

  	# it 'can be created' do
  	# 	expect(@post).to be_valid
  	# end


  	it "cannot be created" do
  		@post.date = nil
  		@post.rationale = nil
  		@post.adjustment = nil
  		@post.Department = nil
  		
  		expect(@post).to_not be_valid
  	end
  end
end
