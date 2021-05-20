class RemoveCountryIdFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :country_id, :integer
  end
end
