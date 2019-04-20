class Api::Errors::ParamsErrorsSerializer < Api::Errors::BaseErrorsSerializer
  I18N_SCOPE = [:params_exception]

  def errors
    [{code: code, message: message}]
  end

  private
  def code
    error_type[:code]
  end

  def message
    error_type[:message]
  end

  def error_type
    @error_type ||= I18n.t class_name_underscore, scope: I18N_SCOPE
  end

  def class_name_underscore
    object.class.name.underscore.gsub(%r{\/}, ".")
  end
end
