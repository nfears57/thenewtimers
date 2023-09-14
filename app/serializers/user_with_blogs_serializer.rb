# app/serializers/user_with_blogs_serializer.rb
class UserWithBlogsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password, :unique_clicks, :number_of_blogs
  has_many :blogs
end

