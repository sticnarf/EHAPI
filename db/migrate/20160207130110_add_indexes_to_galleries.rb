class AddIndexesToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_index :galleries, [:gid, :token]
    add_index :galleries, :tags, using: 'gin'
    execute "CREATE INDEX galleries_idx ON galleries USING gin(to_tsvector('english', title));"
  end
end
