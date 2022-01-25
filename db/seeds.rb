# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
for a in 546..898 do # currently there are 898 pokemons
  poke_response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{a}")
  newpoke = Pokemon.find_or_initialize_by(name: poke_response['name'])
  unless newpoke.new_record?
    next
  end
  newpoke = Pokemon.new
  newpoke.name = poke_response['name']
  newpoke.pokedex_number = poke_response['id']
  newpoke.height = poke_response['height']
  newpoke.weight = poke_response['weight']
  # add n abilities
  i = 0
  while i < poke_response['abilities'].size
    temp_name = poke_response.dig('abilities', i, 'ability', 'name')
    temp_ability = Trait.find_or_initialize_by(name: temp_name)
    if temp_ability.new_record?
      temp_ability.trait_type = 'ability'
      temp_ability.save
    end
    newpoke.traits << temp_ability
    i += 1
  end
  # add n types
  i = 0
  while i < poke_response['types'].size
    temp_name = poke_response.dig('types', i, 'type', 'name')
    temp_type = Trait.find_or_initialize_by(name: temp_name)
    if temp_type.new_record?
      temp_type.trait_type = 'type'
      temp_type.save
    end
    newpoke.traits << temp_type
    i += 1
  end
  # add n items
  i = 0
  while i < poke_response['held_items'].size
    temp_name = poke_response.dig('held_items', i, 'item', 'name')
    temp_item = Trait.find_or_initialize_by(name: temp_name)
    if temp_item.new_record?
      temp_item.trait_type = 'item'
      temp_item.save
    end
    newpoke.traits << temp_item
    i += 1
  end
  newpoke.sprite = poke_response.dig('sprites', 'front_default')
  newpoke.save
end
