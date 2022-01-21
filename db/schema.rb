# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_120_045_550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'abilities', force: :cascade do |t|
    t.string('name')
    t.integer('poke_id')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
  end

  create_table 'pets', force: :cascade do |t|
    t.string('name')
    t.string('gender')
    t.string('caught_at')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.bigint('pokemon_id', null: false)
    t.bigint('trainer_id', null: false)
    t.index(['pokemon_id'], name: 'index_pets_on_pokemon_id')
    t.index(['trainer_id'], name: 'index_pets_on_trainer_id')
  end

  create_table 'poke_types', force: :cascade do |t|
    t.string('name')
    t.integer('poke_id')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
  end

  create_table 'pokemon_abilities', force: :cascade do |t|
    t.bigint('pokemon_id')
    t.bigint('ability_id')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.index(['ability_id'], name: 'index_pokemons_abilities_on_ability_id')
    t.index(['pokemon_id'], name: 'index_pokemons_abilities_on_pokemon_id')
  end

  create_table 'pokemon_poke_types', force: :cascade do |t|
    t.bigint('pokemon_id')
    t.bigint('poke_type_id')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.index(['poke_type_id'], name: 'index_pokemon_poke_types_on_poke_type_id')
    t.index(['pokemon_id'], name: 'index_pokemon_poke_types_on_pokemon_id')
  end

  create_table 'pokemons', force: :cascade do |t|
    t.string('name')
    t.string('poke_id')
    t.string('image_url')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
    t.index(['poke_id'], name: 'index_pokemons_on_poke_id', unique: true)
  end

  create_table 'trainers', force: :cascade do |t|
    t.string('name')
    t.string('last_name')
    t.integer('age')
    t.string('region')
    t.string('hometown')
    t.datetime('created_at', precision: 6, null: false)
    t.datetime('updated_at', precision: 6, null: false)
  end

  add_foreign_key 'pets', 'pokemons'
  add_foreign_key 'pets', 'trainers'
end
