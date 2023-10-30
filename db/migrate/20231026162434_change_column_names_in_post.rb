class ChangeColumnNamesInPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :Author_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
