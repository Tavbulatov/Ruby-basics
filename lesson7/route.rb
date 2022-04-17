# frozen_string_literal: true

class Route
  attr_reader :stations, :name

  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :format, /^[a-zA-Z]{3,}\w$/
  validate :name, :type, String

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
end
