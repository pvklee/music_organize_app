class ChangeTracks2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :tracks

    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.string :track_type, null: false, default: 'regular'
    
      t.timestamps
    end
    add_index :tracks, [:ord, :album_id], unique: true
  end
end
