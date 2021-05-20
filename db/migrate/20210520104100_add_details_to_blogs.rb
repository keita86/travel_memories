class AddDetailsToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :country_name, :string
  end
end
