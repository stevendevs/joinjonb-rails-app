class AddFieldsToCourses < ActiveRecord::Migration[8.0]
  def change
    # Coordenadas
    add_column :courses, :location_x, :decimal
    add_column :courses, :location_y, :decimal

  end
end
