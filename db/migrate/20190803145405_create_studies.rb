class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.string :study_title
      t.string :review
      t.integer :user_id

      t.timestamps
    end
  end
end
