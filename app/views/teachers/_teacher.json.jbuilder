json.extract! teacher, :id, :name, :email, :login, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
