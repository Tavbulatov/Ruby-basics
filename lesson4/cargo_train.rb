class CargoTrain < Train
  def add_carriage(carriages)
    if carriages.class == CarriageCargo
      @carriages << carriages
    else
      puts "Вагон не соответствует типу поезда."
    end
  end
end
