module Pano
  class EmailValidator < ActiveModel::EachValidator
    EMAIL_REGEX = /^[a-z0-9][a-z0-9._%+-]*@(?:[-a-z0-9]+\.)+[a-z]{2,}$/i

    def validate_each(object,attribute,value)
      if value.blank?
        object.errors[attribute] << (options[:message] || "can't be blank") unless options[:allow_blank]
      elsif !(value =~ EMAIL_REGEX)
        object.errors[attribute] << (options[:message] || 'is not a valid email address')
      end
    end
  end
end
