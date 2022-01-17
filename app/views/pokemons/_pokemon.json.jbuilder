json.extract! pokemon, :id, :name, :poke_id, :sort, :image_url, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
