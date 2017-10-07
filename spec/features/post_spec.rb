require 'rails_helper'

describe 'navigate' do
  before do
    # @user = User.create(first_name:"rohan" , last_name:"arora" ,email:"rohan1@gmail.com" , password:"rohanarora" , password_confirmation:"rohanarora");
      @user = FactoryGirl.create(:user)
      login_as(@user , :scope => :user)
  end

  describe 'index' do
  before do
    visit posts_path
  end

  it 'can be reached successfully' do
    expect(page.status_code).to eq(200)
  end

  it 'has a title of Posts' do
    expect(page).to have_content(/Posts/)
  end

  it 'has a list of posts' do
    
  # post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
  post1 = FactoryGirl.create(:post)
  post1 = FactoryGirl.create(:second_post)
  visit posts_path
  expect(page).to have_content(/Rationale|content/)

  end
  end

   describe 'creation' do

    before do
      visit new_post_path
    end

	  it 'a new post can be created' do
  		expect(page.status_code).to eq(200)
    end

   	it 'can be created from new form page' do
	   fill_in 'post[date]', with: Date.today
	   fill_in 'post[rationale]', with: "some rationale"
     click_on "Save"
     expect(page).to have_content("some rationale")
    
    end

    it 'will have user associated with it' do
     fill_in 'post[date]', with: Date.today
     fill_in 'post[rationale]', with: "User Association"
     click_on "Save"
     expect(User.last.posts.last.rationale).to eq("User Association")
    end

    it 'can be reached by clicking edit on index page' do
      post = FactoryGirl.create(:post)
      visit posts_path
      click_link 'Edit'
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]' , with: Date.today
      fill_in 'post[rationale]' , with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
   	
   end
 end
end