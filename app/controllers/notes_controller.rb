class NotesController < ApplicationController

  before_action :find_note, only:  [:show, :update]


  def index
    notes = Note.all
    render json: notes.to_json(
        include: {
          line: { 
            except: [
              :created_at
            ]
         }}
      ), status: :ok
  end

  def show
      render json: @note.to_json(
        include: {
          lines: { 
            except: [
              :created_at
            ]
         }}
      )

  end

  def create
    note = Note.new(note_params)
    if note.save
         @line = Line.where(id: note.line_id)
      render json: @line, status: :created
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    note = Note.find(params[:id])
    if note.destroy
        @line = Line.where(id: note.line_id)

    render json: @line, status: :ok
  end
end


private

  def note_params
    params.permit(:line_id, :content)
  end

  def find_note
    @note = Note.find(params[:id])
  end

  # def authorize_user
  #   #user is authorized IF they are the admin OR the creator of the event
  #   user_can_modify = @book.user_id == current_user.id
  #   render json: {error: "You don't have permission to perform that action"}, 
  #   status: :forbidden unless user_can_modify 
  #   #is the current use an admin?
  # end

end
