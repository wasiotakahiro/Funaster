class CreateFunastar < ActiveRecord::Migration[5.1]
  def change
    create_table :funastars do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :image
      t.text :caption

      t.timestamps
    end
  end
end
