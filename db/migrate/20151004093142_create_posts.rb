class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, length: 255
      t.text :description, length: 65535

      t.timestamps null: false
    end
  end
end
