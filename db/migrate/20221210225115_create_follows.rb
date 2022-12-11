class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end
    add_index :follows, :follower_id
    add_index :follows, :followed_user_id
    add_index :follows, %i[follower_id followed_user_id], unique: true
  end
end
