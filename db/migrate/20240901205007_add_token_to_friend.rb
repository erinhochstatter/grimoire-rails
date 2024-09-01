class AddTokenToFriend < ActiveRecord::Migration[7.0]
  def change
    change_table :friends do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :session_token, null: false, index: { unique: true }
    end
  end
end
