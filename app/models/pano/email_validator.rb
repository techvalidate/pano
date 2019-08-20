module Pano
  class EmailValidator < ActiveModel::EachValidator
    EMAIL_REGEX = /\A([\w+\-].?)+(?<!\.)@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/i

    def validate_each(object,attribute,value)
      if value.blank?
        object.errors[attribute] << (options[:message] || "can't be blank") unless options[:allow_blank]
      elsif !(value =~ EMAIL_REGEX)
        object.errors[attribute] << (options[:message] || 'is not a valid email address')
      end
    end
  end
end
