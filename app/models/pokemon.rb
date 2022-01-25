class Pokemon < ApplicationRecord
  has_many :trainer_pokemons
  has_many :trainers, through: :trainer_pokemons

  has_many :pokemon_traits
  has_many :traits, through: :pokemon_traits

  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 25 }
  validates :height, presence: true
  validates :weight, presence: true
  validates :height, numericality: { only_integer: true }
  validates :weight, numericality: { only_integer: true }
  validates :height, numericality: { in: 1..100 }
  validates :weight, numericality: { in: 1..100 }
end
