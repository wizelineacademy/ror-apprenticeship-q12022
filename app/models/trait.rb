class Trait < ApplicationRecord
  # self.ignored_columns = %w(created_at updated_at id)
  VALID_TRAITS = %w[item ability type]
  has_many :pokemon_traits
  has_many :pokemons, through: :pokemon_traits
  validates :trait_type, presence: true
  validates :name, presence: true,
                   length: { maximum: 25 },
                   uniqueness: true
  validate :valid_type

  private

  def valid_type
    if !VALID_TRAITS.include?(trait_type.downcase)
      errors.add("#{trait_type} is not a valid trait", :trait_type)
    end
  end
end
