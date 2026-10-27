class CreateShareSpaceCanvas < ActiveRecord::Migration[8.1]
  def change
    create_table :share_space_canvases do |t|
      t.string :name, null: false, default: "Untitled canvas"
      t.integer :width, null: false, default: 1200
      t.integer :height, null: false, default: 800
      t.string :background_color, null: false, default: "#ffffff"

      t.timestamps
    end
  end
end
