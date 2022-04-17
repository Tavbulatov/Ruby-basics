# frozen_string_literal: true

class CarriagePass < Carriage
  attr_reader :total, :volume

  include Manifacturer

  def fill
    @volume += 1 if @total > @volume
  end
end
