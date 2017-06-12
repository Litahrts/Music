class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
