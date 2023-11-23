class ClassifiedSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :location, :description, :image_data
end
