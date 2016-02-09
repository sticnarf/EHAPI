class RemoveShowkeyFromPictures < ActiveRecord::Migration[5.0]
  def change
   remove_column :pictures, :showkey
  end
end
