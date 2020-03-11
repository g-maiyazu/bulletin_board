class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :caption, presence: true, length: { maximum: 140 }
end
