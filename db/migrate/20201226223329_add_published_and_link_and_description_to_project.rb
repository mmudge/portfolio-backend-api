class AddPublishedAndLinkAndDescriptionToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :published, :boolean
    add_column :projects, :link, :string
    add_column :projects, :description, :text
  end
end
