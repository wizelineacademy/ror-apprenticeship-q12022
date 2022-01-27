class TrainerPokemon < ApplicationRecord
  #Joint table model to match trainers with pokemons
  belongs_to :trainer
  belongs_to :pokemon
end
