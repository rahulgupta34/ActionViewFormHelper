class Post < ApplicationRecord
    include ActiveModel::Validations
    

    validates :title, :body, presence: true
    validates :picture, presence: true, on: :create
    validates :picture, file_content_type: { allow: ['image/jpeg', 'image/png'], message: " must be attached." }
    
    mount_uploader :picture, ImageUploader
end
