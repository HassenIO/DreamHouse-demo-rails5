class AddFloorplanToPropertiesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :floorplan, :string
  end
end
