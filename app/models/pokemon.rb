class Pokemon < ApplicationRecord
  has_many :trainer_pokemons
  has_many :trainers, :through => :trainer_pokemons

  has_many :pokemon_traits
  has_many :traits, :through => :pokemon_traits
end
