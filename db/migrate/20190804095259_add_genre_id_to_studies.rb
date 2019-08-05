class AddGenreIdToStudies < ActiveRecord::Migration[5.2]
  def change
    add_column :studies, :genre_id, :integer
  end
end
