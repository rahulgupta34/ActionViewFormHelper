class UserMailer < ApplicationMailer
    default from: "rohitkumar44jhansi@gmail.com"

    layout 'update_email'

    def user_created
        @user =  params[:user]
        @deployed = "http://bpldeveloper.herokuapp.com/"
        mail(to: @user.email, subject: "Welcome to Simform World")
    end

    def update_email
        @user =  params[:user]
        @deployed = "http://bpldeveloper.herokuapp.com/"
        mail(to: @user.email, subject: "Regarding Email Updation.")
    end
end
