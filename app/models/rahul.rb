class Rahul < ApplicationRecord
    has_one_time_password column_name: :otp_secret_key, length: 4

    validates :name, :age, :email, presence: true
end
