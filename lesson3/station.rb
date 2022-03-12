class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def list_trains
    @trains.each {|trains| puts trains}
  end

  def list_trains_type(type)
    @trains.select {|trains|trains.type_train == type}
  end

  def send_train(train)
    @trains.delete(train) if @trains.include?(train)
    puts 'Поезд отправился'
  end
end
