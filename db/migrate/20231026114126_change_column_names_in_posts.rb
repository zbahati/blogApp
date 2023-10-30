class ChangeColumnNamesInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :AuthorId_id, :Author_id
    rename_column :posts, :CommentsCounter, :Comments_counter
    rename_column :posts, :LikesCounter, :Likes_counter
  end
end
