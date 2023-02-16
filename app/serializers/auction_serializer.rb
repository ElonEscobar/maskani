class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :valid, :end_date, :user_id, :is_verified
end
