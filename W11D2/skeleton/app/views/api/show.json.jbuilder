json.poke do
  json.extract! @poke, :id, :name, :attack, :defense, :poke_type, :image_url
end