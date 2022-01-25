class Trait < ApplicationRecord
  #self.ignored_columns = %w(created_at updated_at id)
  has_many :pokemon_traits
  has_many :pokemons, :through => :pokemon_traits
end
