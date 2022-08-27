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


  private
    def post_params
      params.require(:post).permit(:title, :content, :author, :publish, :evaluation, {:category_ids => [] })
    end
end
