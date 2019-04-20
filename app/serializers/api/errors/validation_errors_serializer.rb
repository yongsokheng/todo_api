class Api::Errors::ValidationErrorsSerializer < Api::Errors::BaseErrorsSerializer
  def errors
    object.errors.details.map do |field, details|
      details.map.with_index do |error_details, index|
        Api::Errors::EachValidationErrorSerializer.new(
          object, field, error_details, object.errors[field][index]).generate
      end
    end.flatten
  end
end
