class AddObjectToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :object, polymorphic: true
  end
end
