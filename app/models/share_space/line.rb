module ShareSpace
  class Line < CanvasElement
    validates :points, presence: true
  end
end
