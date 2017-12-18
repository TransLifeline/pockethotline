class SecurePasswordValidator < ActiveModel::EachValidator
  include UsersHelper

  def validate_each(record, attribute, value)
    if not secure_password?(value)
      record.errors[attribute] << ("Password does not meet our security requirements. Please use a password at least 8 characters long, including a number and a special character ($@%^!*).")
    end
  end
end
