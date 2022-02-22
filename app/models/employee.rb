class Employee < ApplicationRecord
    has_many :addresses, dependent: :destroy
    accepts_nested_attributes_for :addresses

    validates :name, :email, :mobile, :password, :birth_date, :document, :gender, :address, presence: true
end
