class Api::PokemonsController < ApplicationController
  before_action :set_pokemon
  def show
    @pokemon.traits.ignored_columns = %w(created_at updated_at id)
    render json: {
      name: @pokemon.name,
      pokedex_number: @pokemon.pokedex_number,
      weight: @pokemon.weight,
      height: @pokemon.height,
      sprite: @pokemon.sprite,
      traits: @pokemon.traits
    }
  end

  private
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end
end
