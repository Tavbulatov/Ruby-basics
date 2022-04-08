class Interface
  attr_reader :stations, :trains, :routers

  def initialize
    @routers = []
    @stations = []
    @trains = []
    @stations << Station.new('Panfilovskaya')
    @stations << Station.new('Kutuzovskaya')
    @routers << Route.new('Dnepr', @stations[0], @stations[1])
    @trains << PassengerTrain.new('Tuzik', :passenger)
    @trains << CargoTrain.new('Golub', :cargo)
  end

  def menu
    loop do
      text = "
      Введите 1 :Создать станцию,
      Введите 2 :Создать поезд,
      Введите 3 :Создать маршрут,
      Введите 4 :Добавить станцию в маршрут
      Введите 5 :Удалить станцию из маршрута,
      Введите 6 :Назначить маршрут поезду,
      Введите 7 :Добавить вагон к поезду,
      Введите 8 :Отцепить вагон от поезда,
      Введите 9 :Переместить поезд по маршруту вперед и назад,
      Введите 10:Просмотреть список станций, список поездов на станции и вагоны поездов,
      Введите 11:Занять место
      Введите 12:Для выхода из МЕНЮ,
      Введите 13:Для выхода из программы.\n".split(',')

      text.each { |text| print text }

      print '      =========  Введите число :'

      case gets.to_i
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        add_station_route
      when 5
        delete_station_route
      when 6
        give_train_route
      when 7
        carriages_add
      when 8
        carriages_delete
      when 9
        go_station_train
      when 10
        map
      when 11
        take_place
      when 12
        break
      when 13
        exit
      end
    end
  end

  private

  def create_station
    loop do
      puts 'Введите название станции(для выхода нажмите 0) :'
      name = gets.strip.capitalize
      break if name == '0'

      @stations << Station.new(name)
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def create_train
    loop do
      puts 'Выберите тип поезда, для создания ПАССАЖИРСКОГО нажмите "1" / ГРУЗОВОГО "2"'
      puts 'Для выхода в МЕНЮ нажмиет 0.'
      number = gets.chomp
      break if number == '0'

      begin
        puts 'Введите номер для поезда'
        name = gets.chomp
        case number.to_i
        when 1
          @trains << PassengerTrain.new(name, :Passenger)
        when 2
          @trains << CargoTrain.new(name, :Cargo)
        end
      rescue RuntimeError => e
        puts e.message
        retry
      end
      puts "Поезд с номером #{name} создан успешно!"
    end
  end

  def create_route
    puts 'Как назовем маршрут?'
    name = gets.strip.capitalize
    puts 'При создании Маршрута нужно и только можно в обязательном порядке указать 2 станции из списка ниже.'
    show_station
    puts 'Введите номер для Первой станции'
    station1 = gets.to_i
    puts 'Введите номер для Конечной станции'
    station2 = gets.to_i
    @routers << Route.new(name, @stations[station1 - 1], @stations[station2 - 1])
    puts 'Станции успешно добавлены'
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_station_route
    route = select_route('Выберите номер маршрута в которую хотите добавить станцию :')
    puts 'Укажите станцию которую вы хотите добавить:'
    stations_show
    route.add_station(@stations[gets.to_i - 1])
    puts 'Станиция добавлена'
  end

  def delete_station_route
    route = select_route('Выберите номер маршрута из которой хотите удалить станцию :')
    puts 'Укажите станцию которую вы хотите удалить(кроме первой и последней):'
    route.stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
    route.delete_station(gets.to_i)
    puts 'Станиция удалена'
  end

  def go_back_train
    train = select_train('Выберите номер поезда который поедет Назад.')
    train.go_back_station
  end

  def go_next_train
    train = select_train('Выберите номер поезда который поедет Вперед.')
    train.go_next_station
  end

  def go_station_train
    puts 'Поехать вперед нажмите 1 /назад 2'
    case gets.to_i
    when 1
      go_next_train
    when 2
      go_back_train
    end
  end

  def give_train_route
    train = select_train
    route = select_route
    train.route_reception(route)
  end

  def carriages_add
    train = select_train
    puts 'Сколько вагонов прицепить?'
    total = gets.to_i
    puts 'Укажите кол-во мест если (пассажир.вагон) или объем(грузовой вагон)'
    begin
      quantities = gets.to_i
      carriage_klass = train.instance_of?(PassengerTrain) ? CarriagePass : CarriageCargo
      total.times do
        train.add_carriage(carriage_klass.new(quantities, carriage_klass.to_s.slice(8..12)))
      end
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def select_train(message = 'Выберите поезд')
    puts message
    trains_show
    @trains[gets.strip.to_i - 1]
  end

  def select_route(message = 'Выберите маршрут')
    puts message
    routers_show
    @routers[gets.strip.to_i - 1]
  end

  def carriages_delete
    train = select_train
    puts 'Сколько вагонов отцепить?'
    total = gets.to_i
    total.times do
      train.carriages.shift
    end
  end

  def map
    @stations.each do |station|
      puts "Станция: #{station.name}"
      station.each_train do |train|
        puts "Номер поезда:#{train.number} Тип:#{train.type} Количество вагонов:#{train.carriages.size}"
        train.each_carriage do |carriage|
          puts "Номер вагона:#{carriage.number} Тип:#{carriage.type} Свободно:#{carriage.free_volume} Занято:#{carriage.volume}"
        end
      end
    end
  end

  def take_place
    @trains.each do |train|
      puts "Номер поезда:#{train.number}"
      train.each_carriage do |carriage|
        puts "Номер вагона:#{carriage.number} Тип:#{carriage.type} Свободно:#{carriage.free_volume} Занято:#{carriage.volume}"
      end
    end
    train = select_train
    puts 'Выберите вагон'
    number = gets.to_i
    train_klass = train.instance_of?(PassengerTrain) ? PassengerTrain : CargoTrain
    case train_klass.to_s
    when 'PassengerTrain'
      train.carriages[number - 1].fill
    when 'CargoTrain'
      puts 'Укажите объем для груза'
      volume = gets.to_i
      train.carriages[number - 1].fill(volume)
    end
  end

  def show_station
    @stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def routers_show
    @routers.each.with_index(1) { |route, index| puts "#{index} - #{route.name}" }
  end

  def trains_show
    @trains.each.with_index(1) { |train, index| puts "#{index} - #{train.number} | #{train.type}" }
  end
end
