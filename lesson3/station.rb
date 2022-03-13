class Station
  attr_reader :train, :name

  def initialize(name)
    @name = name
    @train = []
  end

  def add_train(train)
    @train << train
  end

  def list_train
    @train.each { |train| puts train }
  end

  def list_train_type(type)
    @train.select { |train|train.type == type }
  end

  def send_train(train)
    @train.delete(train) if @train.include?(train)
    puts 'Поезд отправился'
  end
end
