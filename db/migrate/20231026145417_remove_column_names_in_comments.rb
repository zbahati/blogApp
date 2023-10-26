class RemoveColumnNamesInComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :Post_id
  end
end
