class AddIndexToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_index :pokemons, :poke_id, unique: true
  end
end
