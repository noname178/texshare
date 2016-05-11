class ShareController < ApplicationController
  def index
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to search_index_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :lesson, :teacher, :under, :status)
  end
end
