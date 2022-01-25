# frozen_string_literal: true

# Pokemon Controller
class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show edit update destroy]
  before_action :set_select_list_values, only: %i[new create show edit update destroy]
  #before_action :set_pokemon_params, only: %i[create update destroy]

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show; end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit; end

  # POST /pokemons or /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params.except(:abilities, :poke_types))
    @pokemon.abilities = pokemon_params[:abilities].reject(&:empty?).map { |ability| Ability.find(ability) }
    @pokemon.poke_types = pokemon_params[:poke_types].reject(&:empty?).map { |poke_type| PokeType.find(poke_type) }
    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to(pokemons_url, notice: 'Pokemon was successfully created.') }
        format.json { render(:show, status: :created, location: @pokemon) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @pokemon.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    # @pokemon.update(pokemon_params.except(:abilities, :poke_types))
    @pokemon.abilities = pokemon_params[:abilities].reject(&:empty?).map { |ability| Ability.find(ability) }
    @pokemon.poke_types = pokemon_params[:poke_types].reject(&:empty?).map { |poke_type| PokeType.find(poke_type) }
    respond_to do |format|
      if @pokemon.update(@pokemon.attributes)
        format.html { redirect_to(pokemons_url, notice: 'Pokemon was successfully updated.') }
        format.json { render(:show, status: :ok, location: @pokemon) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @pokemon.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    @pokemon.destroy!

    respond_to do |format|
      format.html { redirect_to(pokemons_url, notice: 'Pokemon was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def set_select_list_values
    @poke_types = PokeType.all
    @abilities = Ability.all
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:name, :poke_id, :image_url, :abilities => [], :poke_types => [])
  end

end
