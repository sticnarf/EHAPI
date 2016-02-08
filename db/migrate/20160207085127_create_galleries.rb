class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.timestamp :posted_at
      t.string :language
      t.string :file_size
      t.integer :length
      t.float :rating
      t.integer :gid
      t.string :token
      t.string :title
      t.string :cover
      t.string :sort
      t.string :tags, array: true

      t.timestamps
    end
  end
end
