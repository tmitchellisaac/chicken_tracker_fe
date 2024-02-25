class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
  end
end