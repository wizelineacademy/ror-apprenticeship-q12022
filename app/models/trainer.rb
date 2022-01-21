class Trainer < ApplicationRecord
  has_many :pokemon_poketeam
  has_many :teams, :through => :pokemon_poketeam
end
