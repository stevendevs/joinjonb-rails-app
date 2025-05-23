class AddCoordinatesToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :location, :string
    add_column :courses, :x, :decimal
    add_column :courses, :y, :decimal
  end
end
