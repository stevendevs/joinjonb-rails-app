class RemoveOldLocationFieldsFromCourses < ActiveRecord::Migration[8.0]
  def change
    remove_column :courses, :location_x, :decimal
    remove_column :courses, :location_y, :decimal
  end
end
