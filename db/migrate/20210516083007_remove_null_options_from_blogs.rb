class RemoveNullOptionsFromBlogs < ActiveRecord::Migration[5.2]
  def down
    change_column :blogs, :description, :text, null: false
  end
  def up
    change_column :blogs, :description, :text, null: true
  end

end
