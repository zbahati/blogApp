class ChangeColumnNamesInComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :UserId_id, :User_id
    rename_column :comments, :PostId_id, :Post_id
  end
end
