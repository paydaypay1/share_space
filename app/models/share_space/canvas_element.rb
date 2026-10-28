module ShareSpace
  class CanvasElement < ApplicationRecord
    belongs_to :canvas, inverse_of: :elements

    scope :visible, -> { where(visible: true) }
    scope :ordered, -> { order(:z_index, :id) }

    ELEMENT_TYPES = %w[Rectangle Ellipse Polygon Line BezierLine FreeformLine Cube Sphere Cylinder Mask].freeze

    validates :type, inclusion: { in: ELEMENT_TYPES.map { |name| "ShareSpace::#{name}" } }

      validates :x, :y, numericality: true
    validates :opacity, numericality: { in: 0.0..1.0 }

    def hide!
      update!(visible: false)
    end

    def show!
      update!(visible: true)
    end
  end
end
