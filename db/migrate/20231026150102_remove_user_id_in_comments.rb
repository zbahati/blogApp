class RemoveUserIdInComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :User_id
  end
end
