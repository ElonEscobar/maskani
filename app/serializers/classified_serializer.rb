class ClassifiedSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :contact, :location, :occupation, :description, :user_id, :is_verified
end
