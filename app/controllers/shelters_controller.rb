class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
  end

  def edit
    @facade = ShelterFacade.new(params)
    @shelter = @facade.shelter
  end

  # def update
  #   @facade = ShelterFacade.new(params)
  # end
end