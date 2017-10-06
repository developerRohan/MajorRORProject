require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
      @user = User.create(first_name:"rohan" , last_name:"arora" ,email:"rohan@gmail.com" , password:"rohanarora" , password_confirmation:"rohanarora");
  	end
  	it "can be created" do
  		expect(@user).to be_valid
  	end

  	it "cannot be created without firstname and lastname" do
  		@user.first_name = nil
  		@user.last_name = nil
  		expect(@user).to_not be_valid
  	end
  	
  	end
end
