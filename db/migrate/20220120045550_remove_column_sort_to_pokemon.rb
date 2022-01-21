class RemoveColumnSortToPokemon < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :sort, :string
  end
end
