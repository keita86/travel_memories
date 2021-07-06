class AddHomeImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :home_image_id, :string
  end
end
