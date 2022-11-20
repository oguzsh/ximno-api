class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was created successfully!'
    else
      errors = @post.errors.full_messages.join(', ')
      redirect_to new_post_path, alert: "Post was not created because #{errors}"
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post
  end

  def update
    @post.update(body: params[:body])
  rescue ActiveRecord::RecordInvalid => e
    # Add error handling
  end

  def destory
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:body, :user, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
