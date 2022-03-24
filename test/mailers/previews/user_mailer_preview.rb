# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
     
    def user_created
        UserMailer.with(user: User.last).user_created
    end
end
