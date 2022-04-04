class CreateSimforms < ActiveRecord::Migration[7.0]
  def change
    create_table :simforms do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :password
      t.integer :age
      t.text :description
      t.boolean :join
      t.date :date_of_joining

      t.timestamps
    end
  end
end
