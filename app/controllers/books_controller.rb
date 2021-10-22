class BooksController < ApplicationController

  # get rid of this skip before action later
 
  before_action :find_book, only:  [:show, :update]
  # before_action :authorize_user, only: [:show, :update]

  def index
    books = current_user.books.all
    render json: books.to_json(
        include: {
          lines: { 
            except: [
              :created_at
            ]
         }}
      ), status: :ok
  end

  def show
      render json: @book.to_json(
        include: {
          lines: { 
            include: {
              notes: {}
             }
         }}
      )

  end

  def create
    book = current_user.books.new(create_book_params)
      if book.save
        render json: book, status: :created
      else
        render json: book.errors, status: :unprocessable_entity
      end
  end
   
  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: book, status: :ok
  end

private

  def book_params
    params.permit(:title, :summary, :author, :user_id, :finished)
  end

  def create_book_params
    params
      .require(:book)
      .permit(:title, :summary, :author, :user_id, :finished,
              lines_attributes: [:id, :book_id, :content]
            ) 
  end

  def create_line_params
    params
      .permit(
              lines_attributes: [:content]
            ) 
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def authorize_user
    #user is authorized IF they are the admin OR the creator of the event
    user_can_modify = @book.user_id == current_user.id
    render json: {error: "You don't have permission to perform that action"}, 
    status: :forbidden unless user_can_modify 
    #is the current use an admin?
  end

end
