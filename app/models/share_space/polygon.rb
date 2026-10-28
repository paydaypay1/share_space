module ShareSpace
  class Polygon < CanvasElement
    validates :points, presence: true
  end
end
