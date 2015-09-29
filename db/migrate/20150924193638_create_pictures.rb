class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :img_url, null: false
      t.integer :day_id
      t.timestamps null: false
    end
  end
end
