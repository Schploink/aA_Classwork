@pokemon.each do |creature|
  json.set! creature.id do
    json.extract! creature, :id, :name
    json.image_url asset_path("pokemon_snaps/#{creature.image_url}")
  end
end
