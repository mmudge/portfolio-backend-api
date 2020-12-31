class ContactMailer < ApplicationMailer
  def contact_message
    @email = params[:email]
    @message = params[:body]
    @name = params[:name]
    # mail(to: 'michaeltmudge@gmail.com', subject: @message, from: 'porftfolio@michaelmudge.com')
    mail(to: 'michaeltmudge@gmail.com', subject: @message)
  end
end
