class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :contact_title
      t.string :contact_message
      t.integer :user_id

      t.timestamps
    end
  end
end
