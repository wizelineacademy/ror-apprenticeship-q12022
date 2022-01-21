# frozen_string_literal: true

require 'resolv-replace' # This solve net issue 'Net::OpenTimeout: Failed to open TCP connection'

desc 'FillAbilities'
task fill_abilities: :environment do
  abilities_json = HTTParty.get('https://pokeapi.co/api/v2/ability?limit=15000')
rescue StandardError => e
  Rails.logger.debug(e)
else
  abilities_json['results'].each do |item|
    poke_request = HTTParty.get(item['url'])
    ability_new = Ability.new
    ability_new.name = poke_request['name']
    ability_new.name[0] = ability_new.name[0].capitalize
    ability_new.poke_id = poke_request['id']
    ability_new.save!
  rescue ActiveRecord::RecordNotUnique => e
    Rails.logger.debug(e)
  rescue StandardError => e
    Rails.logger.debug(e)
  end
end

desc 'FillPokeTypes'
task fill_poke_types: :environment do
  poke_types_json = HTTParty.get('https://pokeapi.co/api/v2/type?limit=1500')
rescue StandardError => e
  Rails.logger.debug(e)
else
  poke_types_json['results'].each do |item|
    poke_request = HTTParty.get(item['url'])
    poke_type_new = PokeType.new
    poke_type_new.name = poke_request['name']
    poke_type_new.name[0] = poke_type_new.name[0].capitalize
    poke_type_new.poke_id = poke_request['id']
    poke_type_new.save!
  rescue ActiveRecord::RecordNotUnique => e
    Rails.logger.debug(e)
  rescue StandardError => e
    Rails.logger.debug(e)
  end
end

desc 'FillPokemons'
task fill_pokemons: :environment do
  pokedex_json = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=200')
rescue StandardError => e
  Rails.logger.debug(e)
else
  pokedex_json['results'].each do |item|
    poke_request = HTTParty.get(item['url'])
    poke_new = Pokemon.new
    poke_new.name = poke_request['name']
    poke_new.name[0] = poke_new.name[0].capitalize
    poke_new.poke_id = poke_request['id']
    poke_new.image_url = poke_request['sprites']['front_default']
    poke_new.poke_types << poke_request['types'].map do |type|
      PokeType.find_by_cc('name', type['type']['name'])
    end
    poke_new.abilities << poke_request['abilities'].map do |ability|
      Ability.find_by_cc('name', ability['ability']['name'])
    end
    poke_new.save!
  rescue ActiveRecord::RecordNotUnique => e
    Rails.logger.debug(e)
  rescue StandardError => e
    Rails.logger.debug(e)
  end
end
