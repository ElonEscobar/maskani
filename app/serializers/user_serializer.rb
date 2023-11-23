class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :contact, :location, :category, :image_data, :properties, :classifieds
end
