class Post < ApplicationRecord
    has_paper_trail on: [:update, :create, :destroy]
end
