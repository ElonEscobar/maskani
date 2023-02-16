class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category, :user_id, :is_verified
end
