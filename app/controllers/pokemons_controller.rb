class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show edit update destroy]
  protect_from_forgery prepend: true
  before_action :authenticate_trainer!, only: %i[new create edit update remove destroy]
  # GET /pokemons or /pokemons.json
  def index
    if params[:gen].nil? || !(params[:gen].to_i.between?(1,8))
      @pagy, @pokemons = pagy(Pokemon.all.order(:pokedex_number))
    else
      case params[:gen]
      when "1"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 1..151).order(:pokedex_number))
      when "2"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 152..251).order(:pokedex_number))
      when "3"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 252..386).order(:pokedex_number))
      when "4"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 387..493).order(:pokedex_number))
      when "5"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 494..649).order(:pokedex_number))
      when "6"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 650..721).order(:pokedex_number))
      when "7"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 722..809).order(:pokedex_number))
      when "8"
        @pagy, @pokemons = pagy(Pokemon.where(pokedex_number: 810..898).order(:pokedex_number))
      end
    end
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons or /pokemons.json
  def create
    @trainer = Trainer.find_by_trainer_tag("hehehe")
    puts @trainer.trainer_tag
    @pokemon = Pokemon.new(pokemon_params)
    new_dexnumber = Pokemon.order(:pokedex_number).last.pokedex_number + 1
    @pokemon.pokedex_number = new_dexnumber
    # @pokemon.trainer_tag = "Aldo"
    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: "Pokemon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def team

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight,:sprite)
  end
end

#
# form_for(object, url, method: , data: {turbo: false}
# data: {turbo: false}
