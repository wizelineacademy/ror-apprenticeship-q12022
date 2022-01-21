class CreateAbilityPokemonJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :poke_id

      t.timestamps
    end

    create_table :pokemon_abilities do |t|
      t.belongs_to :pokemon
      t.belongs_to :ability

      t.timestamps
    end
  end
end
