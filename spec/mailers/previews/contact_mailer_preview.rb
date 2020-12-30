# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_message
    message = Message.new({ body: "bla bla", email: "joe@gmail.com", name: "joe shmo" })

    # ContactMailer.with(from: message[:from], body: message[:body]).contact_message
    ContactMailer.with(email: message[:email], name: message[:name], body: message[:body]).contact_message
  end
end
