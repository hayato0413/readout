class PostController < ApplicationController
  def index  
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_index_path
    else 
      redirect_to post_index_path
    end
  end

  def show 
    @post = Post.find_by(id: params[:id])
  end

  def post_user 
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, :author, :publish, :evaluation, {:category_ids => [] }).merge(user_id: current_user.id)
    end
end
