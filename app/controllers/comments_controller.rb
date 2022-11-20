class CommentsController < ApplicationController
  before_action :set_post, only: %i[index show create destory]

  def index
    @comments = @post.comments.all
  end

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to root_path, notice: 'Comment was created successfully!'
    else
      errors = @comment.errors.full_messages.join(', ')
      redirect_to root_path, alert: "Comment was not created because #{errors}"
    end
  end

  def show
    @comment
  end

  def destory
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user, :post)
  end
end
