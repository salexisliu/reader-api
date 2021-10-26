class FlashcardsController < ApplicationController

   before_action :find_card, only: [:show]
     # get rid of this skip before action later CURRENTLY MAKING FLASHCARDS
  skip_before_action :authorized

  def index
    flashcards = Flashcard.all
    render json: flashcards.to_json(
       include: {
          book: { 
            except: [
              :created_at
            ]
         }}
    )
  end

 def show
    render json: @card
  end

  def create
    flashcard = Flashcard.new(card_params)
    if flashcard.save
      render json: flashcard, status: :created
    else
      render json: flashcard.errors, status: :unprocessable_entity
    end
  end

  def destroy
    card = Flashcard.find(params[:id])
    card.destroy
    render json: card, status: :ok
  end

  private

  def card_params
    params.permit(:book_id, :term, :definition, :learned)
   
  end

  def find_card
    @card = Flashcard.find(params[:id])
  end

end
