class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :category
      t.integer :user_id
      t.boolean :is_verified

      t.timestamps
    end
  end
end
