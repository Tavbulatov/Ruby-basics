class Interface
  attr_reader :stations, :trains, :routers

  def initialize
    @routers = []
    @stations = []
    @trains = []
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
      Введите 10 :Просмотреть список станций и список поездов на станции,
      Введите 11:Для выхода из МЕНЮ,
      Введите 12:Для выхода из программы.\n".split(',')

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
        show_station_and_train
      when 11
        break
      when 12
        exit
      end
    end
  end

  private

  def create_station
    loop do
      puts 'Введите название станции(для выхода нажмите Enter) :'
      name = gets.strip.capitalize
      break if name == ''
      @stations << Station.new(name)
    end
  end

  def create_train
    loop do
      puts 'Выберите тип поезда, для создания ПАССАЖИРСКОГО нажмите "1" / ГРУЗОВОГО "2"'
      puts 'Для выхода в МЕНЮ нажмиет Enter.'
      number = gets.chomp
      break if number == ''
      puts 'Введите номер для поезда'
      name = gets.chomp
      case number.to_i
      when 1
        @trains << PassengerTrain.new(name)
      when 2
        @trains << CargoTrain.new(name)
      end
    end
  end

  def create_route
    puts 'Как назовем маршрут?'
    name = gets.strip.capitalize
    puts 'При создании Маршрута нужно и только можно в обязательном порядке указать 2 станции из списка ниже.'
    stations_show
    puts 'Введите номер для Первой станции'
    station1 = gets.chomp.to_i
    puts 'Введите номер для Конечной станции'
    station2 = gets.to_i
    @routers << Route.new(name, @stations[station1 - 1], @stations[station2 - 1])
    puts 'Станции успешно добавлены'
  end

  def add_station_route
    route = select_route("Выберите номер маршрута в которую хотите добавить станцию :")
    puts "Укажите станцию которую вы хотите добавить:"
    stations_show
    route.add_station(@stations[gets.to_i- 1])
    puts "Станиция добавлена"
  end

  def delete_station_route
    route = select_route("Выберите номер маршрута из которой хотите удалить станцию :")
    puts "Укажите станцию которую вы хотите удалить(кроме первой и последней):"
    route.stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
    route.delete_station(gets.to_i)
    puts "Станиция удалена"
  end

  def go_back_train
    train = select_train("Выберите номер поезда который поедет Назад.")
    train.go_back_station
  end

  def go_next_train
    train = select_train("Выберите номер поезда который поедет Вперед.")
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
    train = select_train('Выберите поезд')
    route = select_route('Выберите маршрут')
    train.route_reception(route)
  end

  def carriages_add
    train = select_train('Выберите какому поезду прицепить вагоны')
    puts 'Сколько вагонов прицепить?'
    total = gets.to_i
    cargo_klass = train.class == PassengerTrain ? CarriagePass : CarriageCargo
    total.times do
        train.add_carriage(cargo_klass.new)
    end
  end

  def select_train(message = 'Выберите поезд')
    puts message
    trains_show
    @trains[gets.strip.to_i - 1]
  end

  def select_route(message = "Выберите маршрут")
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

  def show_station_and_train#тут пытался показать поезда на каждой станцию (в блоке вызывал еще итерацию )
    @stations.each_with_index do |station, index|
      puts "#{index}--#{station.name}"
    end
  end

  def stations_show
    @stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def routers_show
    @routers.each.with_index(1) { |route, index | puts "#{index} - #{route.name}" }
  end

  def trains_show
    @trains.each.with_index(1) { |train, index| puts "#{index} - #{train.name}" }
  end
end
