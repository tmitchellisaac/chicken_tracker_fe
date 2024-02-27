class AnimalService


  def conn
    Faraday.new(url: "http://localhost:5000") do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_animal(animal_id, shelter_id)
    get_url("api/v1/shelters/#{shelter_id}/animals/#{animal_id}")
  end

  def post_url(url)
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def create_animal(new_animal_data)
  #   response = conn.post("/api/v1/shelters/#{new_animal_data[:shelter_id]}/animals") do |req|
  #     req.headers['CONTENT_TYPE" => "application/json']
  #     req.body = JSON.generate(animal: new_animal_data)
  #   end
  #   require 'pry'; binding.pry
  #  JSON.parse(response.body, symbolize_names: true)
  # end

  def conn_2
    Faraday.new(url: "http://localhost:5000") do |faraday|
      faraday.adapter Faraday.default_adapter # Ensure you have this line to set the adapter
    end
  end
  
  def create_animal(new_animal_data)
    response = conn_2.post("/api/v1/shelters/#{new_animal_data[:shelter_id]}/animals") do |req|
      req.headers['Content-Type'] = 'application/json' # Corrected the typo here
      req.body = JSON.generate(animal: new_animal_data)
    end
    # Assuming the use of `pry` for debugging purposes, which is fine
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_animal_service(updated_animal_data, animal_id)
    response = conn_2.patch("/api/v1/shelters/#{updated_animal_data[:shelter_id]}/animals/#{animal_id}") do |req|
      req.headers['Content-Type'] = 'application/json' # Corrected the typo here
      req.body = JSON.generate(animal: updated_animal_data)
    end
    # Assuming the use of `pry` for debugging purposes, which is fine
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

end