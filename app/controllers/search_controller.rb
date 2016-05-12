class SearchController < ApplicationController
  def index
    posts = Post.all
    posts = posts.where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    posts = posts.where('lesson LIKE ?', "%#{params[:lesson]}%") if params[:lesson].present?
    posts = posts.where('teacher LIKE ?', "%#{params[:teacher]}%") if params[:teacher].present?
    posts = posts.where(under: params[:under]) if params[:under].present?
    posts = posts.where(status: params[:status]) if params[:status].present?
    @posts = posts.order('created_at desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to :back
  end

  def destroy
    @post =  Post.find(params[:id])
    @post.destroy
    redirect_to search_index_path
  end

  def message
    post = Post.find(params[:id])
    @messages = post.messages
    @message = Message.new
  end

  def create_message
    Message.create(message_params)
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:receiver_id)
  end

  def message_params
    params.require(:message).permit(:user_id, :post_id ,:content)
  end
end
