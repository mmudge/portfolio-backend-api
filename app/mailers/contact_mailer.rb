class ContactMailer < ApplicationMailer
  def contact_message
    @email = params[:email]
    @message = params[:body]
    @name = params[:name]
    mail(to: 'michaeltmudge@gmail.com', subject: @message, from: @mail)
  end
end
