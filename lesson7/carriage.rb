class Carriage
  attr_reader :total, :volume, :type, :number

  include Manifacturer
  include InstanceCounter
  include Validate

  def initialize(total, type)
    @number = register_instance
    @type = type
    @total = total
    @volume = 0 # примечание:для пасс.класса volume-это объем занятых мест,для груз -объем занятого простран-ва
    validate!
  end

  def free_volume # свободный(х) объем(мест)
    @total - @volume
  end

  private

  def validate!
    raise 'Вы не указали количество мест' if @total == 0
  end
end
