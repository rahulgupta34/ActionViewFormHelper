# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
     
    def user_created
        UserMailer.with(user: User.last).user_created
    end

    def update_email
        UserMailer.with(user: User.last).update_email
    end
end
