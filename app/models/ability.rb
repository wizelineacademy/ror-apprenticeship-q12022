# frozen_string_literal: true

class Ability < ApplicationRecord
  include FindByCapitalCase
  # scope :find_by_cc, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  has_many :pokemon_abilities, class_name: 'PokemonAbility', dependent: :nullify
  has_many :pokemons, through: :pokemons_abilities
end
