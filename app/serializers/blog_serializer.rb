class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :category_id, :user_id, :created_at, :updated_at, :comment_count
  has_many :comments

  # def comment_count
  #   object.comments.count
  # end
end
