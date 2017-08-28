require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
  		@user = User.create(email:"abc@gmail.com" , password: "abcdef" , password_confirmation: "abcdef" , first_name: "rohan" , last_name: "arora") 
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
