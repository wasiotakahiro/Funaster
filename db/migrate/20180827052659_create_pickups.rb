class CreatePickups < ActiveRecord::Migration[5.1]
  def change
    create_table :pickups do |t|
      t.integer :funastar_id
      t.integer :user_id
    end
  end
end
