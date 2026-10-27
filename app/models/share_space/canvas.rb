module ShareSpace
  class Canvas < ApplicationRecord
    has_many :elements,
           class_name: "CanvasElement",
           dependent: :destroy,
           inverse_of: :canvas

    validates :name, presence: true
    validates :width, numericality: { greater_than: 0 }
    validates :height, numericality: { greater_than: 0 }
  end
end
