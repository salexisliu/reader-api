class FlashcardsController < ApplicationController

  before_action :find_card, only: [:show]

  def index
    @flashcards = current_user.flashcards.all
    render json: @flashcards.to_json(
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
    flashcard = current_user.flashcards.new(create_card_params)
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

  def create_card_params
    params
      .permit(:book_id, :term, :definition, :learned, :user_id) 
  end
end
