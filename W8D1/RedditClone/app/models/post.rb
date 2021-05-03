class Post < ApplicationRecord

  belongs_to :user,
  foreign_key: :author_id,
  class_name: :User

  has_many :sub_ids,
  foreign_key: :post_id,
  class_name: :PostSub,
  dependent: :destroy,
  inverse_of: :posts

  has_many :subs,
  through: :sub_ids,
  source: :subs

  # belongs_to :sub,
  # foreign_key: :sub_id,
  # class_name: :Sub
end
