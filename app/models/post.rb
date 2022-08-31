class Post < ApplicationRecord

  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end

  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  has_many :favorites, dependent: :destroy

  belongs_to :user
end
