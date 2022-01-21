class Trait < ApplicationRecord
  has_many :pokemon_traits
  has_many :pokemons, :through => :pokemon_traits
end
