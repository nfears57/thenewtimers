class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :number_of_likes
end
