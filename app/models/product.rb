class Product < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    
    mount_uploaders :images, AvatarUploader
    serialize :images, JSON
    has_many :orders, dependent: :destroy
 
end
