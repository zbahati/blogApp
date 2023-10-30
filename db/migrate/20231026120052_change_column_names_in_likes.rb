class ChangeColumnNamesInLikes < ActiveRecord::Migration[7.1]
  def change
    rename_column :likes, :userID_id, :User_id
    rename_column :likes, :postId_id, :Post_id
  end
end
