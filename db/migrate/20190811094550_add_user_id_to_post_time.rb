class AddUserIdToPostTime < ActiveRecord::Migration[5.2]
  def change
    add_column :post_times, :user_id, :integer
  end
end
