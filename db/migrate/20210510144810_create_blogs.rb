class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false
      t.string :image_id, null: false, default: ""
      t.integer :user_id
      t.integer :country_id

      t.timestamps
    end
  end
end
