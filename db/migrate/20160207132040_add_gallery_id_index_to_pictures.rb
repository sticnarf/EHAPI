class AddGalleryIdIndexToPictures < ActiveRecord::Migration[5.0]
  def change
    add_index :pictures, :gallery_id
  end
end
