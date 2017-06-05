class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.text :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
