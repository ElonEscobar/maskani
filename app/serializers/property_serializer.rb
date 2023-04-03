class PropertySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :amenities, :home_type, :price, :image_data
end
