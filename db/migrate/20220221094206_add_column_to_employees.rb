class AddColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :cpp, :string
  end
end
