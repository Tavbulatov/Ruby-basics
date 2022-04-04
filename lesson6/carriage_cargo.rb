class CarriageCargo < Carriage
  attr_reader :total, :volume
  include Manifacturer
end
