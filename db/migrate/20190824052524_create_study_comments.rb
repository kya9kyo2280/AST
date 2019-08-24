class CreateStudyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :study_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :study_id

      t.timestamps
    end
  end
end
