module ShareSpace
  class CanvasesController < ApplicationController
    before_action :set_canvas, only: %i[show edit update destroy]

    def index
      @canvases = Canvas.order(updated_at: :desc)
    end

    def show
      @elements = @canvas.elements.ordered
      @element = @canvas.elements.build(type: "ShareSpace::Rectangle", width: 160, height: 100,
                                        fill_color: "#48c78e", stroke_color: "#257953", stroke_width: 2)
    end

    def new
      @canvas = Canvas.new(width: 1200, height: 800, background_color: "#ffffff")
    end

    def create
      @canvas = Canvas.new(canvas_params)
      if @canvas.save
        redirect_to canvas_path(@canvas), notice: "Canvas created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @canvas.update(canvas_params)
        redirect_to canvas_path(@canvas), notice: "Canvas updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @canvas.destroy
      redirect_to canvases_path, notice: "Canvas deleted."
    end

    private

    def set_canvas
      @canvas = Canvas.find(params[:id])
    end

    def canvas_params
      params.require(:canvas).permit(:name, :width, :height, :background_color)
    end
  end
end
