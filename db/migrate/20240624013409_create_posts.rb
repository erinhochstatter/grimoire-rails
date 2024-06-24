class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :kind
      t.date :datePublished
      t.date :coverImagePath
      t.timestamps
    end
  end
end
