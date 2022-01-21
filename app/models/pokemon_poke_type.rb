# frozen_string_literal: true

class PokemonPokeType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :poke_type
end
