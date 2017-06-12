class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :song_id
      t.integer :user_id

      t.timestamps
    end

    add_index :likes, :song_id
    add_index :likes, :user_id
    add_index :likes, [:user_id, :song_id], unique: true
  end
end
