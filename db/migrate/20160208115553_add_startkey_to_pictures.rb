class AddStartkeyToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :startkey, :string
    add_index :pictures, [:gallery_id, :page]
  end
end
