class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  def author
    user
  end

   def as_json(options={})
    super.merge(user: user)
  end
end
