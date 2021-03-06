class PostsController < ApplicationController
	
	before_action :find_post , only: [:show , :edit , :update , :destroy , :approve]
	def index 
    # @posts = current_user.posts
		@posts =Post.posts_by(current_user).page(params[:page]).per(10) # it is always better to apply database validations in model rather than in controllers 
	end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: "The post has been approved"
  end

	def new
		@post = Post.new
	end

	def create
	    @post = Post.new(post_params)
	    @post.user_id = current_user.id
	    if @post.save
			redirect_to @post , notice: "your post was created successfully"
		else
			render :new
		end
  	end

  	def edit
      authorize @post
  	end

  	def update
       authorize @post
    if @post.update(post_params)
  		redirect_to @post, notice: 'Your post was updated successfully'
  	else
  		render :edit

  	end

  	end

  	def show

  	end

  	def destroy
  		@post.delete
  		redirect_to posts_path, notice: 'Your post was deleted successfully'
  	end
  	
  	private

  	def post_params
  		params.require(:post).permit(:date , :rationale  , :status , :overtime_request)
  	end

  	def find_post
  		@post = Post.find(params[:id])
  	end


end

