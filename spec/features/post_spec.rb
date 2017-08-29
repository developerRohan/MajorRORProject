require 'rails_helper'

describe 'navigate' do
	before do
		@user = User.create(email: "rohan@gmail.com" , password: "rohanarora" , password_confirmation: "rohanarora" , first_name: "rohan" , last_name: "arora")
		login_as(@user , :scope => :user)
	end

  describe 'index' do
  	it 'can be reached successfully' do
  		visit posts_path
  		expect(page.status_code).to eq(200)
	end

	it 'has a title of Posts' do
		visit posts_path
		expect(page).to have_content(/Posts/)
	end


	it 'has a list of posts' do 
  		post1  = Post.create(date: Date.today , rationale: "anything" , adjustment: "anybody" , Department: "ECE" , count: 1 , user_id: @user.id);
  		post2 = Post.create(date: Date.today , rationale: "anything" , adjustment: "anybody" , Department: "ECE" , count: 1, user_id: @user.id);
  		visit posts_path
  		expect(page).to have_content(/anything|anything/)
	end
   end



   describe 'creation' do
   	it 'has a new form to reach' do
   		visit new_post_path
   		expect(page.status_code).to eq(200)
	end

	it 'can be created from new form page' do
	  visit new_post_path
	  fill_in 'post[date]', with: Date.today
	  fill_in 'post[rationale]', with: "something"
	  fill_in 'post[adjustment]', with: "some person"
	  fill_in 'post[Department]', with: "some value"
	  fill_in 'post[count]', with: "1"
	  

	  click_on "Save"
	  expect(page).to have_content("something")
	end

	# it 'will have a user associated it' do
 #      # fill_in 'post[date]', with: Date.today
 #      fill_in 'post[rationale]', with: "User Association"
 #      fill_in 'post[adjustment]' , with: "User Department"
 #      fill_in 'post[Department]' , with: "User Department"
 #      fill_in 'post[count]' , with: 1
 #      fill_in 'post[user_id]'  , with: @user.id
 #      click_on "Save"

 #      expect(User.last.posts.last.rationale).to eq("User Association")
 #    end
	
   end
end