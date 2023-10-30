class ChangeColumnNamesInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :PostsCounter, :Posts_counter
  end
end
