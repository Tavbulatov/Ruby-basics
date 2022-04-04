class Station
  attr_reader :trains, :name, :stat_index
  include InstanceCounter
  include Validate
  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@station
  end

  def add_train(train)
    @trains << train
  end

  def list_train
    @trains.each { |train| puts train }
  end

  def send_train(train)
    @trains.delete(train) if @trains.include?(train)
    puts 'Поезд отправился'
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  private

  def validate!
    raise 'Нет имени' if @name == ''
    raise 'Вы превысили предел длины названия до 10 букв' if @name.size > 15
  end
end
