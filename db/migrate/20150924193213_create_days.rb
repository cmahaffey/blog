class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_number
      t.text :day_blog
      t.timestamps null: false
    end
  end
end
