class CreateFunastar < ActiveRecord::Migration[5.1]
  def change
    create_table :funastars do |t|
      t.integer :user_id
      t.text :image
      t.text :caption

      t.timestamps
    end
  end
end
