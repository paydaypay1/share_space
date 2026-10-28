module ShareSpace
  class CanvasElementsController < ApplicationController
    before_action :set_canvas
    before_action :set_element, only: %i[update destroy]

    def create
      type = element_params[:type].presence || "ShareSpace::Rectangle"
      unless CanvasElement::ELEMENT_TYPES.map { |name| "ShareSpace::#{name}" }.include?(type)
        return head :unprocessable_entity
      end

      @element = @canvas.elements.new(element_params.except(:type).to_h.merge(type: type))
      if @element.save
        payload = element_json(@element)
        broadcast_change("create", payload)
        render json: payload, status: :created
      else
        render json: { errors: @element.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @element.update(element_params.except(:type))
        payload = element_json(@element)
        broadcast_change("update", payload)
        render json: payload
      else
        render json: { errors: @element.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      payload = element_json(@element)
      @element.destroy
      broadcast_change("delete", payload)
      head :no_content
    end

    private

    def set_canvas
      @canvas = Canvas.find(params[:canvas_id])
    end

    def set_element
      @element = @canvas.elements.find(params[:id])
    end

    def element_params
      params.require(:element).permit(:type, :name, :x, :y, :width, :height, :rotation,
                                     :fill_color, :stroke_color, :stroke_width, :opacity,
                                     :visible, :locked, :z_index, points: [], options: {})
    end

    def element_json(element)
      { id: element.id, type: element.type, name: element.name, x: element.x.to_f, y: element.y.to_f,
        width: element.width&.to_f, height: element.height&.to_f, rotation: element.rotation.to_f,
        fill_color: element.fill_color, stroke_color: element.stroke_color,
        stroke_width: element.stroke_width&.to_f, opacity: element.opacity.to_f,
        visible: element.visible, locked: element.locked, points: element.points, options: element.options || {} }
    end

    def broadcast_change(action, element)
      ActionCable.server.broadcast("share_space_canvas_#{@canvas.id}", { type: "element", action: action, element: element })
    end
  end
end
