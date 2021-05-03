class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true

  belongs_to :moderator,
  foreign_key: :moderator_id,
  class_name: :User

  has_many :post_ids,
  foreign_key: :sub_id,
  class_name: :PostSub,
  dependent: :destroy,
  inverse_of: :subs

  has_many :posts,
  through: :post_ids,
  source: :posts

  # has_many :posts,
  # foreign_key: :sub_id,
  # class_name: :Post
end
