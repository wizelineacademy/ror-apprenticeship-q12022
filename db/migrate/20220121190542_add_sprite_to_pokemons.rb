class AddSpriteToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :sprite, :string
  end
end
