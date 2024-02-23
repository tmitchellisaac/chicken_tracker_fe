class AnimalService
  def conn
    Faraday.new(url: "http://localhost:3000") do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_animal(animal_id)
    get_url("api/v1/animals/#{animal_id}")
  end
end