module ShareSpace
  class Cylinder < CanvasElement
    validates :width, :height, numericality: { greater_than: 0 }
  end
end
