class DropValid < ActiveRecord::Migration[7.0]
  def change
    remove_column :auctions, :valid
    add_column :auctions, :is_valid, :boolean


  end
end
