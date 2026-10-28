module ShareSpace
  class Sphere < CanvasElement
    validates :width, :height, numericality: { greater_than: 0 }
  end
end
