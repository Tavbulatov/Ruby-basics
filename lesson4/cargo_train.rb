class CargoTrain < Train
  def add_carriage(carriage)
    super(carriage) if carriage.class == CarriageCargo
  end
end
