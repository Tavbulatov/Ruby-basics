class Train
  attr_reader :type, :carriages, :name, :route, :stat_index, :speed

  def initialize(name, type, carriages)
    @name=name
    @type = type
    @carriages = carriages
    @speed = 0
    @stat_index = 0
  end

  def up_speed
    @speed += 10
  end

  def stop
    @speed = 0
    puts "Поезд остановлен"
  end

  def attach
    if @speed.zero?
      @carriages += 1
      puts "Вагон прицеплен.Кол-во вагонов: #{@carriages}"
    else
      puts "Водитель будь внимателен к работе.Поезд движется"
    end
  end

  def detach
    if @speed.zero? && @carriages.positive?
      @carriages -= 1
      puts "Вагон отцеплен.Кол-во вагонов: #{@carriages}"
    elsif @carriages.zero?
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
      puts 'Вы на крайней станции, дальше нельзя поехать!!!'
    else
      current_station.send_train(self)
      @stat_index += 1
      current_station.add_train(self)
    end
  end

  def go_back_station
    if current_station == @route.stations.first
      puts 'Вы на первой станции, назад нельзя поехать!!!'
    else
      current_station.send_train(self)
      @stat_index -= 1
      current_station.add_train(self)
    end
  end

  def current_station
    @route.stations[@stat_index]#текущая станция
  end

  def next_station
    @route.stations[@stat_index + 1]
  end

  def previous_station
    @route.stations[@stat_index - 1]
  end
end
