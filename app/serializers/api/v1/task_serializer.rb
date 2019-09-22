class Api::V1::TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed
end
