class Station
  attr_reader :train, :name, :stat_index
  include InstanceCounter
  @@stations = []

  def initialize(name)
    @name = name
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
end
