class CreatePokemonTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_traits do |t|
      t.integer "pokemon_id"
      t.integer "trait_id"
      t.timestamps
    end
    add_index("pokemon_traits",["pokemon_id","trait_id"])
  end
end
