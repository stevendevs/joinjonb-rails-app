class AddSlugColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:users, :slug)
      add_column :users, :slug, :string
    end

    unless index_exists?(:users, :slug)
      add_index :users, :slug, unique: true
    end
  end
end
