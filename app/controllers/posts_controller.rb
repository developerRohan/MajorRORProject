class PostsController < ApplicationController

	before_action :set_post , only: [:show]

	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def show
	end

	private

	def post_params
		params.require(:post).permit(:date , :Department , :adjustment , :rationale , :count)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
