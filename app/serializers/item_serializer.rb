class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category, :image_data
end
