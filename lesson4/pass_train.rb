class PassengerTrain < Train
  def add_carriage(carriages)
    if carriages.class == CarriagePass
      @carriages << carriages
    else
      puts "Вагон не соответствует типу поезда."
    end
  end
end
