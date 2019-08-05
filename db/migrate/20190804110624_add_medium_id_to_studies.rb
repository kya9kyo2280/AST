class AddMediumIdToStudies < ActiveRecord::Migration[5.2]
  def change
    add_column :studies, :medium_id, :integer
  end
end
