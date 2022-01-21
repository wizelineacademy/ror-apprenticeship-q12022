class CreatePokeTypePokemonJoinTable < ActiveRecord::Migration[7.0]
    def change
      create_table :poke_types do |t|
        t.string :name
        t.integer :poke_id
  
        t.timestamps
      end
  
      create_table :pokemon_poke_types do |t|
        t.belongs_to :pokemon
        t.belongs_to :poke_type
  
        t.timestamps
      end
    end
  end