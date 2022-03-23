class Product < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    serialize :images, JSON
    has_many :orders, dependent: :destroy

end
