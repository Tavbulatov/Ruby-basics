# frozen_string_literal: true

# validate :name, :presence
# validate :name, :format, /A-Z/
# validate :name, :type, String

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, *args)
      @validations ||= []
      @validations << { name: name, type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        var_name = instance_variable_get("@#{validation[:name]}")
        send("validate_#{validation[:type]}", var_name, *validation[:args])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate_presence(value)
      raise 'Значение не должно быть пустым' if value.nil? || value.empty?
    end

    def validate_format (value, format)
      raise 'Значение не соответствует формату' if value !~ format
    end

    def validate_type(value, attribute_class)
      raise 'Объект не соответствует классу' unless value.class == attribute_class
    end
  end
end
