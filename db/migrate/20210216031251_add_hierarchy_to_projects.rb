class AddHierarchyToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :hierarchy, :integer
  end
end
