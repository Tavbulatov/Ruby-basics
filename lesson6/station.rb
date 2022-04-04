class Station
  attr_reader :train, :name, :stat_index
  include InstanceCounter
  include Validate
  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @train = []
    @@stations << self
    register_instance
  end

  def self.all
    @@station
  end

  def add_train(train)
    @train << train
  end

  def list_train
    @train.each { |train| puts train }
  end

  def send_train(train)
    @train.delete(train) if @train.include?(train)
    puts 'Поезд отправился'
  end

  def show_train_station
    @train.each { |train| yield(train) }
  end

  private

  def validate!
    raise 'Нет имени' if @name == ''
    raise 'Вы превысили предел длины названия до 10 букв' if @name.size > 15
  end
end
