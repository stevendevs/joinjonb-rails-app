class RenameXyToLatitudeLongitudeInCourses < ActiveRecord::Migration[8.0]
  def change

    rename_column :courses, :x, :latitude
    rename_column :courses, :y, :longitude
  end
end
