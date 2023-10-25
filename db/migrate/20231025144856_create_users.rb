class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :Name
      t.text :Photo
      t.string :Bio
      t.integer :PostsCounter

      t.timestamps
    end
  end
end
