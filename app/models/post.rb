class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :caption, presence: true, length: { maximum: 140 }
end
