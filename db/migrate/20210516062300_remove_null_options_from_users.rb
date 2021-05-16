class RemoveNullOptionsFromUsers < ActiveRecord::Migration[5.2]
  def down
    change_column :users, :introduction, :text, null: false
  end
  def up
    change_column :users, :introduction, :text, null: true
  end
end
