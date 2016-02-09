class RenameColumnNameGalleryIdOfPictures < ActiveRecord::Migration[5.0]
  def change
    rename_column :pictures, :gallery_id, :gid
  end
end
