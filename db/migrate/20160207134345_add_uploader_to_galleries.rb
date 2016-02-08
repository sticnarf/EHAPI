class AddUploaderToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :uploader, :string, index: true
  end
end
