class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :object
  has_one_attached :photo
end
