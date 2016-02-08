class RemoveCover2FromGalleries < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :cover2
  end
end
