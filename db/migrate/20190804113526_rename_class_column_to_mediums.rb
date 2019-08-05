class RenameClassColumnToMediums < ActiveRecord::Migration[5.2]
  def change
  	rename_column :media, :class, :medium_name
  end
end
