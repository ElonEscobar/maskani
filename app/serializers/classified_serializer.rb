class ClassifiedSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :contact, :location, :occupation, :description, :image_data
end
