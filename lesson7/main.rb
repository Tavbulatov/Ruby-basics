require_relative 'validate'
require_relative 'instance_counter'
require_relative 'manifacturer'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'carriage'
require_relative 'carriage_cargo'
require_relative 'carriage_pass'
require_relative 'route'
require_relative 'interface'

interface = Interface.new
interface.menu
# @stations << Station.new('Panfilovskaya')
# @stations << Station.new('Kutuzovskaya')
# @routers << Route.new('Dnepr', @stations[0], @stations[1])
# @trains << CargoTrain.new('Golub')
# @trains << PassengerTrain.new('Scuter')
