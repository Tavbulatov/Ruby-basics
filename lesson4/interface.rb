require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'pass_train.rb'
require_relative 'station.rb'
require_relative 'carriage_cargo.rb'
require_relative 'carriage_pass.rb'
require_relative 'route.rb'

class Interface
  attr_reader :station, :trains, :routers

  def initialize
    @routers = []
    @stations = []
    @trains = []
  end

  def menu

    loop do # отступ для текста ниже я нарушил нарочно, иначе текст в сторону середины экрана встает.
    text = "
    Введите 1 :Создать станцию,
    Введите 2 :Создать поезд,
    Введите 3 :Создать маршрут,
    Введите 4 :Удалить станцию из маршрута,
    Введите 5 :Назначить маршрут поезду,
    Введите 6 :Добавить вагон к поезду,
    Введите 7 :Отцепить вагон от поезда,
    Введите 8 :Переместить поезд по маршруту вперед и назад,
    Введите 9 :Просмотреть список станций и список поездов на станции\n".split(',')

    text.each { |text| print text}

    print  '=========  Введите число :'
    number = gets.to_i

      case number
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4

      when 5

      when 6

      when 7

      when 8

      when 9

      when 10
        break
      when 11
        exit
      end
    end
  end

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
    puts 'При создании Маршрута нужно и только можно в обязательном порядке указать 2 станции из списка ниже.'
    @stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}"}
    puts 'Введите номер для Первой станции'
    station1 = gets.chomp.to_i
    #break if station1 == '' #тут пишет /home/tam/lesson/lesson4/interface.rb:89: Invalid break (SyntaxError)
    puts 'Введите номер для Второй станции'
    station2 = gets.to_i
    @routers << route = Route.new(@stations[station1 - 1], @stations[station2 - 1])
    puts 'Станции успешно добавлены'
  end

  def delete_station_route


  end
end
