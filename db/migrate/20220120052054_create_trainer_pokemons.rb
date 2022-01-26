class CreateTrainerPokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_pokemons do |t|
      t.integer 'trainer_id'
      t.integer 'pokemon_id'
      t.timestamps
    end
    add_index('trainer_pokemons',['trainer_id','pokemon_id'])
  end
end
