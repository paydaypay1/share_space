module ShareSpace
  class FreeformLine < CanvasElement
    validates :points, presence: true
  end
end
