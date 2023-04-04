class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :end_date, :image_data
end
