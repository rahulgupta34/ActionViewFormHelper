json.extract! user, :id, :first_name, :last_name, :email, :password, :subscription_email, :subcription, :created_at, :updated_at
json.url user_url(user, format: :json)
