class AddOtherIndexesToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_index :galleries, [:language, :rating, :sort]
  end
end
