module ShareSpace
  class BezierLine < CanvasElement
    validates :points, length: { is: 4 }
  end
end
