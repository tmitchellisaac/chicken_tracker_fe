class AnimalsController < ApplicationController

  def index;end
  def new
    @facade = AnimalFacade.new(params)
    @animal = Animal.new(params)
  end

  def create
    new_animal_data = ({
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:animal][:name],
      "species": params[:animal][:species],
      "color": params[:animal][:color],
      "birthday": params[:animal][:birthday]
  })
    facade = AnimalFacade.new(params)
    new_animal = facade.create_animal(new_animal_data)
    if new_animal != nil
      flash[:alert] = "Animal successfully created"

      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{new_animal.id}"
    else
      flash[:alert] = "Animal not created, try again"
      render :new
    end
  end

  def show
    @facade = AnimalFacade.new(params)
  end

  def edit
    @facade = AnimalFacade.new(params)
    @animal = @facade.get_animal(params[:id], params[:shelter_id])
  end

  def update
    updated_animal_data = ({
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:animal][:name],
      "species": params[:animal][:species],
      "color": params[:animal][:color],
      "birthday": params[:animal][:birthday]
  })
    facade = AnimalFacade.new(params)
    if facade.update_animal(updated_animal_data).attributes_match?(updated_animal_data)
      flash[:alert] = "You've successfully updated your animal!"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"

    end
  end

  def destroy
    if AnimalFacade.new(params).delete_animal == 204
      flash[:alert] = "Animal successfully deleted"
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      flash[:alert] = "Something went wrong please try again"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"
    end
  end

  private

  def animal_params
    {
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:animal][:name],
      "species": params[:animal][:species],
      "color": params[:animal][:color],
      "birthday": params[:animal][:birthday]
  }
  facade = AnimalFacade.new(params)
  end
  # moved to AnimalFacade-- this heavyweight method allows for a collection dropdown in the view
  # def allowed_species
  #   [
  #     { id: 1, name: "Chicken" },
  #     { id: 2, name: "Bee" },
  #   ].map { |species| OpenStruct.new(species) }
  # end

end
