class CreatePostTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_times do |t|
      t.integer :study_time
      t.integer :user_id

      t.timestamps
    end
  end
end
