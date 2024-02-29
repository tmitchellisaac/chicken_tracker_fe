class ShelterService

  def conn
    Faraday.new(url: "https://hidden-sands-71693-380133048218.herokuapp.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url)
    response = conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_shelter(shelter_id)
    get_url("api/v1/shelters/#{shelter_id}")
  end

  def get_shelters(user_id)
    get_url("api/v1/shelters?user_id=#{user_id}")[:data]
  end

  def get_animals(shelter_id)
    get_url("api/v1/shelters/#{shelter_id}/animals")[:data]
  end
  
  def create_shelter(new_shelter_data)
    response = conn.post("/api/v1/shelters") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(shelter: new_shelter_data)
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_shelter(updated_shelter_data, shelter_id)
    response = conn.patch("/api/v1/shelters/#{shelter_id}") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = JSON.generate(shelter: updated_shelter_data)
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_shelter(shelter_id)
    response = conn.delete("/api/v1/shelters/#{shelter_id}") do |req|
      req.headers['Content-Type'] = 'application/json'
    end
    #binding.pry
    #JSON.parse(response.body, symbolize_names: true)
  end
end