class Post < ApplicationRecord
  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.lanking
    Post.find(Favorite.group(:post_id).order("count(post_id) desc").limit(30).pluck(:post_id))
  end

  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end

  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations

  has_many :favorites, dependent: :destroy

  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 150 }
  validates :author, length: { maximum: 20 }
  validates :publish, length: { maximum: 20 }
  validates :evaluation, presence: true, numericality: { greater_than: 0, less_than: 6 }
end
