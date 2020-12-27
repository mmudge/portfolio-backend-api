class CreateProjectsTechnologiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :projects, :technologies

    # create_join_table :projects, :technologies do |t|
    #   t.index :project_id
    #   t.index :technology_id
    # end
  end
end
