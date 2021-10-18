class LinesController < ApplicationController
  before_action :find_line, only:  [:show, :update]

  def index
    lines = Line.all
    render json: lines
    # .to_json(
       
    #   ), status: :ok
  end

  def show
      render json: @line.to_json(
        include: {
          notes: { 
            except: [
              :created_at
            ]
         }}
      )

  end

 def update
    if @line.update(line_params)
      render json: @line, status: :ok
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

   def create
    line = Line.new(line_params)
    if line.save
      render json: line, status: :created
    else
      render json: line.errors, status: :unprocessable_entity
    end
  end 

  def destroy
    line = Line.find(params[:id])
     line.destroy
    render json: line, status: :ok
  end
  
private
  def find_line
    @line = Line.find(params[:id])
  end


  def line_params
    params.permit(:highlighted, :book_id, :content, :id)
  end
end
