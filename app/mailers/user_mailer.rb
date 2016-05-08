class UserMailer < ActionMailer::Base
  default from: 'krispyshoppe@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
    mail(to: @user.email, subject: 'Welcome to Krispy Shoppe')
  end
end
