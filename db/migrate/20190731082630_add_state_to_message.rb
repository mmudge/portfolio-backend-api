class AddStateToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :state, :string
  end
end
