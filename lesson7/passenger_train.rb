# frozen_string_literal: true

class PassengerTrain < Train
  def add_carriage(carriage)
    super(carriage) if carriage.instance_of?(CarriagePass)
  end
end
