class PropertySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :amenities, :onsale, :price, :user_id, :is_verified
end
