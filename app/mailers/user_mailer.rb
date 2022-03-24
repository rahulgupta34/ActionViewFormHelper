class UserMailer < ApplicationMailer
   
    def user_created
        @user =  params[:user]
        @deployed = "http://bpldeveloper.herokuapp.com/"
        mail(to: @user.email, subject: "Welcome to Simform World")
    end
end
