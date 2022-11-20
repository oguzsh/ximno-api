class FeedsController < ApplicationController
  def index
    # TODO: Add pagination
    @posts = Post.includes(:user, :comments).by_recently_created.limit(20)
  end
end
