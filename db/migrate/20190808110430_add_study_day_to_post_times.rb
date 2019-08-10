class AddStudyDayToPostTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :post_times, :study_day, :date
  end
end
