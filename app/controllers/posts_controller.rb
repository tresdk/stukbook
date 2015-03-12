class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      respond_to do |format|
       format.html {redirect_to user_path(@post.user.username), notice: "post created"}
      end  
    else 
      redirect_to user_path(@post.user.username), notice: "Something went worng"
    end
  end

  def edit    
  end
  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html {redirect_to user_path(@post.user.username), notice: "post updated"}
      end
    else
      redirect_to post_path(@post), notice: "Something went worng"
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to user_path(@post.user.username), notice: "post destroyed"}
    end
  end
  private

  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
