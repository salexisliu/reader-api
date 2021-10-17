class LinesController < ApplicationController
  before_action :find_line, only:  [:show, :update]

  def index
    lines = Line.all
    render json: lines.to_json(
       
      ), status: :ok
  end

  def show
      render json: @line.to_json(
        include: {
          note: { 
            except: [
              :created_at
            ]
         }}
      )

  end

    def find_line
    @line = Line.find(params[:id])
  end

end
