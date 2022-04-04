class Simform < ApplicationRecord
    
    has_one :city, dependent: :destroy
    accepts_nested_attributes_for :city
    validates :password, presence: true, length: { minimum: 6, message: "length should be at least 6 " }, on: :create

    validates :email, :password, :name, presence: true, on: :create
end
