class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.integer :page
      t.integer :gallery_id
      t.string :imgkey
      t.string :showkey

      t.timestamps
    end
  end
end
