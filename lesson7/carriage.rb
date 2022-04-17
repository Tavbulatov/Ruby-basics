# frozen_string_literal: true

class Carriage
  attr_reader :total, :volume, :type, :number

  include Manifacturer
  include InstanceCounter

  def initialize(total, type)
    @number = register_instance
    @type = type
    @total = total
    @volume = 0 # примечание:для пасс.класса volume-это объем занятых мест,для груз -объем занятого простран-ва
  end

  # свободный(х) объем(мест)
  def free_volume
    @total - @volume
  end
end
