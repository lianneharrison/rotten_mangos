class UserMailer < ActionMailer::Base
  default from: "admin@erottenmangoes.com"

  def delete_email(user)
    @user = user
    mail(to: @user.email, subject: 'We have deleted your profile on Rotten Mangoes. Yeah, sorry about that!') do |format|
      format.html { render 'delete_email' }
    end
  end

end


