class DecksController < ApplicationController
  before_action :set_deck, only: %i[show edit update destroy]

  # GET /decks or /decks.json
  def index
    @decks = current_user.decks
  end

  # GET /decks/1 or /decks/1.json
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks or /decks.json
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      redirect_to deck_url(@deck), notice: "Deck was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decks/1 or /decks/1.json
  def update
    if @deck.update(deck_params)
      redirect_to deck_url(@deck), notice: "Deck was successfully updated."
      format.json { render :show, status: :ok, location: @deck }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1 or /decks/1.json
  def destroy
    @deck.destroy

    redirect_to decks_url, notice: "Deck was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:name).merge(user: current_user)
    end
end
