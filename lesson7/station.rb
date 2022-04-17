# frozen_string_literal: true

class Station
  attr_reader :trains, :name, :stat_index

  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :format, /^[a-zA-Z]{3,}\w$/
  validate :name, :type, String

  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@station
  end

  def add_train(train)
    @trains << train
  end

  def list_train
    @trains.each { |train| puts train }
  end

  def send_train(train)
    @trains.delete(train) if @trains.include?(train)
    puts 'Поезд отправился'
  end

  def each_train(&block)
    @trains.each(&block)
  end
end
