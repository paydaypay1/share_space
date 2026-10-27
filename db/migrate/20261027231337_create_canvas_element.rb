class CreateCanvasElement < ActiveRecord::Migration[8.1]
  def change
    create_table :share_space_canvas_elements do |t|
      t.references :canvas,
                   null: false,
                   foreign_key: { to_table: :share_space_canvases }

      t.string :type
      t.string :name

      t.decimal :x, precision: 12, scale: 4, null: false, default: 0
      t.decimal :y, precision: 12, scale: 4, null: false, default: 0
      t.decimal :width, precision: 12, scale: 4
      t.decimal :height, precision: 12, scale: 4
      t.decimal :rotation, precision: 8, scale: 4, default: 0

      t.boolean :visible, null: false, default: true
      t.boolean :locked, null: false, default: false
      t.integer :z_index, null: false, default: 0

      t.string :fill_color
      t.string :stroke_color
      t.decimal :stroke_width, precision: 8, scale: 4
      t.decimal :opacity, precision: 4, scale: 3,
                          null: false, default: 1.0

      t.json :points, null: false, default: []

      t.timestamps
    end

    add_index :share_space_canvas_elements, [:canvas_id, :z_index]
  end
end
