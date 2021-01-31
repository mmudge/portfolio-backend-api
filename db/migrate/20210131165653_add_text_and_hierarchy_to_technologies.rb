class AddTextAndHierarchyToTechnologies < ActiveRecord::Migration[5.2]
  def change
    add_column :technologies, :text, :string
    add_column :technologies, :hierarchy, :integer
  end
end
