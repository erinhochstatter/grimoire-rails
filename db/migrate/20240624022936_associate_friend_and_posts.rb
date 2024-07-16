class AssociateFriendAndPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :friend_id, :bigint, null: false
    add_index :posts, :friend_id
    add_foreign_key :posts, :friends

  end
end
