class ChangeMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :state, :string
    remove_column :messages, :sender_id, :integer
    remove_column :messages, :user_id, :integer
    remove_column :messages, :subject, :string
    add_column :messages, :email, :string
    add_column :messages, :name, :string
  end
end
