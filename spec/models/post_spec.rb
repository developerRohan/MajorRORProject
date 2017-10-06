require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "creation" do
		before do
			@post = Post.create(date: Date.today , rationale:"anything");
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
