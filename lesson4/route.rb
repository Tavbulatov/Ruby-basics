class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.first != station && @stations.last != station
  end

  def station_list
    @stations.each { |station| puts station.name }
  end
end
