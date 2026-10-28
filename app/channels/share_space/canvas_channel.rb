module ShareSpace
  class CanvasChannel < ActionCable::Channel::Base
    def subscribed
      @canvas = Canvas.find_by(id: params[:canvas_id])
      reject unless @canvas && authorized_canvas?

      stream_from "share_space_canvas_#{@canvas.id}"
    end

    def authorized_canvas?
      return true unless connection.respond_to?(:current_user)

      user = connection.current_user
      return false unless user
      return true unless @canvas.respond_to?(:user_id)

      owns_canvas = @canvas.user_id == user.id
      shared_canvas = user.respond_to?(:shared_canvases) && user.shared_canvases.exists?(id: @canvas.id)
      owns_canvas || shared_canvas
    end

    def receive(data)
      return unless data["type"] == "cursor"

      x = data["x"].to_f.clamp(0, @canvas.width.to_f)
      y = data["y"].to_f.clamp(0, @canvas.height.to_f)
      ActionCable.server.broadcast("share_space_canvas_#{@canvas.id}", {
        type: "cursor", client_id: data["client_id"].to_s.first(64), x: x, y: y,
        active: data["active"] != false
      })
    end

    def unsubscribed
      ActionCable.server.broadcast("share_space_canvas_#{@canvas.id}", {
        type: "cursor", client_id: params[:client_id].to_s.first(64), active: false
      }) if @canvas
    end
  end
end
