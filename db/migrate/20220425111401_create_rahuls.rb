class CreateRahuls < ActiveRecord::Migration[7.0]
  def change
    create_table :rahuls do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :otp_secret_key

      t.timestamps
    end
  end
end
