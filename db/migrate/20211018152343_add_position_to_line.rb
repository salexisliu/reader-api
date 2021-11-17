class AddPositionToLine < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :position, :integer
  end
end
