class Route
  attr_reader :stations, :name
  include InstanceCounter
  include Validate

  def initialize(name, first, last)
    @stations = [first, last]
    @name = name
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete_at(station) if @stations.first != station && @stations.last != station
  end

  def station_list
    @stations.each { |station| puts station.name }
  end

  private

  def validate!
    raise 'Нет имени' if @name == ''
    raise 'Проверьте правильны ли станции' unless (@stations.first.kind_of? Station) && (@stations.last.kind_of? Station)
    true
  end
end
