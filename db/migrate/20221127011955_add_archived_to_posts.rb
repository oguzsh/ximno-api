class AddArchivedToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :archived, :boolean, default: false
  end
end
