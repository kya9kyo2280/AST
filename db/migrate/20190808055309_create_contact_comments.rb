class CreateContactComments < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_comments do |t|
      t.string :reply
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
