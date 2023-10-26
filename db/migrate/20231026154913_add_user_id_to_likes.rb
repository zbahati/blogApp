class AddUserIdToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post, null: false, foreign_key: true
    remove_column :likes, :User_id
    remove_column :likes, :Post_id
  end
end
