class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :user_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end