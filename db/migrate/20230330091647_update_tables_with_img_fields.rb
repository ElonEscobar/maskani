class UpdateTablesWithImgFields < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image_data, :text
    add_column :classifieds, :image_data, :text
    add_column :items, :image_data, :text
    add_column :properties, :image_data, :text
    add_column :auctions, :image_data, :text

    remove_column :properties, :onsale, :boolean
    add_column :properties, :home_type, :string

  end
end
