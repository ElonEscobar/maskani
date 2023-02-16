class CreateAuctions < ActiveRecord::Migration[7.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :valid
      t.datetime :end_date
      t.integer :user_id
      t.boolean :is_verified

      t.timestamps
    end
  end
end
