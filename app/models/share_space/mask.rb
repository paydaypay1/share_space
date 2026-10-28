module ShareSpace
  class Mask < CanvasElement
    validates :width, :height, numericality: { greater_than: 0 }
  end
end
