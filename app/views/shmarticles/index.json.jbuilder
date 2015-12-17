json.array!(@shmarticles) do |shmarticle|
  json.extract! shmarticle, :id, :title, :body
  json.url shmarticle_url(shmarticle, format: :json)
end
