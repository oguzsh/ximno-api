class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :body
      t.integer :comments_count
      t.boolean :archived, null: false, default: false
      t.timestamps
    end
  end
end
