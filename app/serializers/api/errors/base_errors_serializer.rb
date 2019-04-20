class Api::Errors::BaseErrorsSerializer < ActiveModel::Serializer
  attribute :success
  attribute :errors

  def success
    false
  end
end
