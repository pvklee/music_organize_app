class ReplaceBands < ActiveRecord::Migration[5.2]
  def change
    drop_table :bands
    create_table :bands do |t|
      t.string :name, null: false
      
      t.timestamps
    end
    add_index :bands, :name, unique: true
  end
end
