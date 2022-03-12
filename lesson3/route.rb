class Route

  attr_reader :stations


  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station) if  @stations.first && @stations.last != station
  end #тут я хотел реализовать защиту чтобы не была возможность удалить 1 и 2 станцию,
      #но 1-я станция всеравно удаляется
  def station_list
    @stations.each {|station| puts station.name}
  end

end
