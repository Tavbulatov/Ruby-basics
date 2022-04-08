class CargoTrain < Train
  def add_carriage(carriage)
    super(carriage) if carriage.instance_of?(CarriageCargo)
  end
end
