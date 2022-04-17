# frozen_string_literal: true

class CarriageCargo < Carriage
  attr_reader :total, :volume

  include Manifacturer

  def fill(volume)
    @volume = volume if @total > volume
  end
end
