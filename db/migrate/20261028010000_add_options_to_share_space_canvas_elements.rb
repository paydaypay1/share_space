class AddOptionsToShareSpaceCanvasElements < ActiveRecord::Migration[8.1]
  def change
    add_column :share_space_canvas_elements, :options, :json, null: false, default: {}
  end
end
