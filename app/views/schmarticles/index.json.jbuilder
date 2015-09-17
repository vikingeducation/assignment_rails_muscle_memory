json.array!(@schmarticles) do |schmarticle|
  json.extract! schmarticle, :id, :title, :body
  json.url schmarticle_url(schmarticle, format: :json)
end
