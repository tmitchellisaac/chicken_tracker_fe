class AnimalImagesController < ApplicationController
    def new
        @shelter_id = params[:shelter_id]
        @animal_id = params[:animal_id]
    end

    def create
        animal_image = AnimalImage.create(id: params[:animal_id].to_i)
        animal_image.image.attach(params[:image])
        animal_image.save

        redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:animal_id]}"
    end

    private
  
    def animal_image_params
        params.permit(:image)
    end
end
  