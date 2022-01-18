# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'resolv-replace' # This solve net issue 'Net::OpenTimeout: Failed to open TCP connection'

begin
  pokedex_json = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=15')
  pokedex_json['results'].each do |item|
    poke_request = HTTParty.get(item['url'])
    poke_new = Pokemon.new
    poke_new.name = poke_request['name']
    poke_new.name[0] = poke_new.name[0].capitalize
    poke_new.poke_id = poke_request['id']
    poke_new.image_url = poke_request['sprites']['front_default']
    poke_new.sort = poke_request['types'].map do |type|
      type['type']['name'].slice(0, 1).capitalize + type['type']['name'].slice(1..-1)
    end.join(',')
    poke_new.save!
  rescue ActiveRecord::RecordNotUnique => e
    Rails.logger.debug(e)
  rescue StandardError => e
    Rails.logger.debug(e)
  end
rescue StandardError => e
  Rails.logger.debug(e)
end
