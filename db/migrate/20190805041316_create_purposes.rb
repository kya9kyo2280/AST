class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes do |t|
      t.integer :purpose_score , null: false ,default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
