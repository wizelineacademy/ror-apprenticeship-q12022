# frozen_string_literal: true

class Ability < ApplicationRecord
  include FindByCapitalCase
  default_scope {order("name ASC")}

  has_many :pokemon_abilities, class_name: 'PokemonAbility', dependent: :nullify
  has_many :pokemons, through: :pokemons_abilities
end
