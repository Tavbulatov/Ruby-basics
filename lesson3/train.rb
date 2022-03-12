class Train

  attr_reader :type_train, :total_vagons, :name, :route, :stat_index

  def initialize(name, type_train, total_vagons)
    @name=name
    @type_train = type_train
    @total_vagons = total_vagons
    @speed = 0
    @stat_index = 0
  end

  def up_speed
    @speed += 10
  end

  def speed
    puts "Текущая скорость:#{@speed}"
  end

  def stop  #Так же в ридере можно изменить скорость до 0 и поднять
    if @speed > 0
      @speed -= 10
    puts "Текущая скорость #{@speed}"
    elsif @speed.zero?
      puts "Поезд остановлен"
    end
  end

  def total_vagons
    puts "Кол-во вагонов #{@total_vagons}"
  end

  def attach
    if @speed.zero?
      @total_vagons += 1
      puts "Вагон прицеплен.Кол-во вагонов: #{@total_vagons}"
    else
      puts "Водитель будь внимателен к работе.Поезд движется"
    end
  end

  def detach
    if @speed.zero? && @total_vagons.positive?
      @total_vagons -= 1
      puts "Вагон отцеплен.Кол-во вагонов: #{@total_vagons}"
    elsif @total_vagons.zero?
      puts "Вагонов больше нет"
    else
      puts "Водитель будь внимателен к работе.Поезд движется"
    end
  end

  def route_reception(route)
    @route = route
    @route.stations.first.add_train(self)#поезд добавляется на первую станцию
  end

  def go_next_station
    if current_station == @route.stations.last
      puts 'Вы на последней станции, дальше нельзя поехать!!!'
    else
      @route.stations[@stat_index].send_train(self)
      @stat_index += 1
      @route.stations[@stat_index].add_train(self)
    end
  end

  def go_back_station
    if current_station == @route.stations.first
      puts 'Вы на первой станции, назад нельзя поехать!!!'
    else
      @route.stations[@stat_index].send_train(self)
      @stat_index -= 1
      @route.stations[@stat_index].add_train(self)
    end
  end

  def current_station
    @route.stations[@stat_index]#текушая станция
  end

  def next_station
     if @stat_index <= @route.stations.size
       @stat_index += 1
       @route.stations[@stat_index]
     end
  end

  def previous_station
    if @stat_index.positive?
      @stat_index -= 1
      @route.stations[@stat_index]
    end
  end
end
