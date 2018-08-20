class AddIconImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :icon_image, :text
  end
end
