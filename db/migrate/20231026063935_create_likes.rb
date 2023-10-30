class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :userID, foreign_key: {to_table: :users}
      t.references :postId, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
