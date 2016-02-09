class RemoveImgkeyAndShowkeyFromPictures < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :imgkey
    add_column :pictures, :url, :string
  end
end
