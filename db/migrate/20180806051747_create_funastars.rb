class CreateFunastars < ActiveRecord::Migration[5.1]
  def change
    create_table :funastars do |t|
      t.string :image
      t.text :caption

      t.timestamps
    end
  end
end
