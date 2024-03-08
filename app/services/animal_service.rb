class AnimalService

  def conn
    Faraday.new(url: "https://hidden-sands-71693-380133048218.herokuapp.com") do |faraday|
      # faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_animal(animal_id, shelter_id)
    get_url("api/v1/shelters/#{shelter_id.to_i}/animals/#{animal_id.to_i}")
  end

  def post_url(url)
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn_2
    Faraday.new(url: "https://hidden-sands-71693-380133048218.herokuapp.com") do |faraday|
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
    response = conn_2.patch("/api/v1/shelters/#{updated_animal_data[:shelter_id]}/animals/#{animal_id.to_i}") do |req|
      req.headers['Content-Type'] = 'application/json' # Corrected the typo here
      req.body = JSON.generate(animal: updated_animal_data)
    end
    # Assuming the use of `pry` for debugging purposes, which is fine
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_animal(animal_id, shelter_id)
    response = conn_2.delete("/api/v1/shelters/#{shelter_id}/animals/#{animal_id}") do |req|
      req.headers['Content-Type'] = 'application/json'
    end
   response.status
  end

end