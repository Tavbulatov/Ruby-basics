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

  private

  def validate!
    raise 'Нет имени' if @name == ''
    raise 'Вы превысили предел размера названия до 15 букв' if @name.size > 15
  end
end
