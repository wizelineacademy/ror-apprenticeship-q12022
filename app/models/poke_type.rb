# frozen_string_literal: true

class PokeType < ApplicationRecord
  include FindByCapitalCase
  #scope :find_by_cc, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  has_many :pokemon_poke_types, class_name: 'PokemonPokeType'
  has_many :pokemons, through: :Pokemons_Poke_Types
end
