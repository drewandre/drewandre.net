class Mailer < ActionMailer::Base
  default to: "drewjamesandre@gmail.com"
  default from: "drewjamesandre@gmail.com"

  def email_to_me(from_email, comments, name, location)
    @from_email = from_email
    @location = location
    @comments = comments
    @name = name
    mail(
      :from => @from_email,
      subject: "Custom work inquiry") do |format|
      format.text
      format.html
    end
  end

  def auto_reply(from_email, name)
    @from_email = from_email
    @name = name
    mail(
      :to => @from_email,
      subject: "Custom work inquiry") do |format|
      format.text
      format.html
    end
  end
end
