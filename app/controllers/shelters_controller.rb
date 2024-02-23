class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
    # require "pry"; binding.pry
  end
end