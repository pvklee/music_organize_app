class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :is_bonus_track, null: false, default: true
    
      t.timestamps
    end
    add_index :tracks, [:ord, :album_id], unique: true
  end
end
