class UserMailer < ApplicationMailer
    default from: ENV['GMAIL_USERNAME']

    layout 'update_email'

    def user_created
        @user =  params[:user]
        attachments.inline['filename.jpg'] = File.read("/home/rahulgupta/Desktop/rails/ActionViewFormHelper/public/#{@user.picture.url}")
        @deployed = "http://bpldeveloper.herokuapp.com/"
        mail(to: @user.email, subject: "Welcome to Simform World")
    end

    def update_email
        @user =  params[:user]
        attachments.inline['filename.jpg'] = File.read("/home/rahulgupta/Desktop/rails/ActionViewFormHelper/public/#{@user.picture.url}")
        @deployed = "http://bpldeveloper.herokuapp.com/"
        mail(to: @user.email, subject: "Regarding Email Updation.")
    end
end
