class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :member_id
      t.string :pass_hash
      t.boolean :exhentai

      t.timestamps
    end
  end
end
