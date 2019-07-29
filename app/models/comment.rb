class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true



  def author
    user
  end
end
