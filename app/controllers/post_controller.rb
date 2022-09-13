class PostController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search, :category, :category_index]
  
  def index  
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else 
      redirect_to post_index_path, alert: "投稿に失敗しました"
    end
  end

  def show 
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(id: @post.id), notice: "投稿を更新しました"
    else 
      render :edit, alert: "投稿の更新に失敗しました"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      redirect_to post_index_path, notice: "投稿を破棄しました"
    else 
      render :show, alert: "投稿の破棄に失敗しました"
    end
  end

  def category_index
  end
  
  def category
    @posts = Post.left_joins(:post_category_relations).where(:post_category_relations => {category_id: params[:id]}).order(created_at: :desc)
    @category = Category.find_by(id: params[:id])
  end

  def favorite 
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @posts = Post.where(id: favorites).order(created_at: :desc)
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: :desc)
    @keyword = params[:keyword]
  end

  def post_user 
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
  end


  private
    def post_params
      params.require(:post).permit(:title, :content, :author, :publish, :evaluation, {:category_ids => [] }).merge(user_id: current_user.id)
    end
end
