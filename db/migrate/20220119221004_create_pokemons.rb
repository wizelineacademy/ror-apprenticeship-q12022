class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string 'name', limit: 25
      t.integer 'pokedex_number', null: false
      t.integer 'weight'
      t.integer 'height'
      t.timestamps
    end
  end
end
