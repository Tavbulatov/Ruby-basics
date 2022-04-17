# frozen_string_literal: true

module Acсessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        args_history = "@#{name}_history".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}_history") { instance_variable_get(args_history) }
        define_method("#{name}=".to_sym) do |name|
          instance_variable_set(var_name, name)
          if instance_variable_get(args_history).nil?
            instance_variable_set(args_history, [])
          else
            instance_variable_get(args_history) << instance_variable_get(var_name)
          end
        end
      end
    end

    def strong_attr_accessor(name, type)
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") do |value|
        raise 'Ошибка.Неправильный тип' unless value.instance_of?(type)

        instance_variable_set("@#{name}", value)
      end
    end
  end
end
