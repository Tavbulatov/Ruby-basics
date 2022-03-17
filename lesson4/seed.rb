station = Station.new('Isa')
station2 = Station.new('Ali')
route = Route.new(station, station2)

passtrain = PassengerTrain.new(123)
cargotrain = CargoTrain.new(456)

passtrain.route_reception(route)
