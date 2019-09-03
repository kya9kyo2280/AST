class AddColumnToPostTime < ActiveRecord::Migration[5.2]
  def change
    add_column :post_times, :deleted_at, :datetime
  end
end
