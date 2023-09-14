class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    has_many :comments, through: :blogs
end
