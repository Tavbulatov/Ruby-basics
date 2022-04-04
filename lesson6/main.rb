require_relative 'validate.rb'
require_relative 'instance_counter.rb'
require_relative 'manifacturer.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'station.rb'
require_relative 'carriage.rb'
require_relative 'carriage_cargo.rb'
require_relative 'carriage_pass.rb'
require_relative 'route.rb'
require_relative 'interface.rb'

interface = Interface.new
interface.menu
# @stations << Station.new('Panfilovskaya')
# @stations << Station.new('Kutuzovskaya')
# @routers << Route.new('Dnepr', @stations[0], @stations[1])
# @trains << CargoTrain.new('Golub')
# @trains << PassengerTrain.new('Scuter')
