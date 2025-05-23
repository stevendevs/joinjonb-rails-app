class AddExtraFieldsToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :short_description, :text
    add_column :courses, :language, :string, default: "Español", null: false
    add_column :courses, :level, :string, default: "Principiante", null: false
    add_column :courses, :price, :integer, default: "0", null: false
  end
  
end
