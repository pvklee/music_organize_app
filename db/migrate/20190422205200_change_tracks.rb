class ChangeTracks < ActiveRecord::Migration[5.2]
  def change
    drop_table :tracks

    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :is_bonus_track, null: false, default: false
    
      t.timestamps
    end
    add_index :tracks, [:ord, :album_id], unique: true
  end
end
