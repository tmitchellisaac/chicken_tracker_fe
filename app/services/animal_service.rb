class AnimalService


  def conn
    Faraday.new(url: "http://localhost:5000") do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_animal(animal_id)
    get_url("api/v1/animals/#{animal_id}")
  end

  def post_url(url)
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def create_animal(new_animal_data)
    response = conn.post("/api/v1/shelters/#{new_animal_data[:shelter_id]}/animals") do |req|
      req.headers['CONTENT_TYPE" => "application/json']
      req.body = JSON.generate(animal: new_animal_data)
    end
   JSON.parse(response.body, symbolize_names: true)
  end
end