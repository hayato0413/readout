class Post < ApplicationRecord

  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  has_many :favorites, dependent: :destroy

  belongs_to :user
end
