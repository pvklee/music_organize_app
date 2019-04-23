class ChangeAlbums < ActiveRecord::Migration[5.2]
  def change
    drop_table :albums

    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :band_id, null: false
      t.string :album_type, null: false, default: 'studio'
      
      t.timestamps
    end
    add_index :albums, :band_id
    add_index :albums, [:title, :band_id], unique: true
  end
end
