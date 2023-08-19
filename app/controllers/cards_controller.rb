class CardsController < ApplicationController
  before_action :set_deck
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards or /cards.json
  def index
    @cards = @deck.cards
  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to card_url(@card), notice: "Card was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    if @card.update(card_params)
      redirect_to card_url(@card), notice: "Card was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy

    redirect_to cards_url, notice: "Card was successfully destroyed."
  end

  private

    def set_deck
      @deck = current_user.decks.find(params[:deck_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @deck.cards.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:front_text, :back_text).merge(deck: @deck, done_count: 0)
    end
end
