class AddIgneousToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :igneous, :string
  end
end
