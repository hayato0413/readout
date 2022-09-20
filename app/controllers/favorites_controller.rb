class FavoritesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    if @post_favorite.save
      redirect_to post_path(params[:post_id]), notice: "投稿をお気に入りしました"
    else 
      redirect_to post_path(params[:post_id]), alert: "投稿をお気に入りできませんでした"
    end
  end

  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @post_favorite.destroy
      redirect_to post_path(params[:post_id]), notice: "お気に入りを取り消しました"
    else 
      redirect_to post_path(params[:post_id]), alert: "お気に入りを取消できませんでした"
    end
  end
end  
