class Mailer < ActionMailer::Base
  default to: "drewjamesandre@gmail.com"

  def notification(from_email, comments, name)
    @from_email = from_email
    @comments = comments
    @name = name
    mail(
      :from => @from_email,
      subject: "Custom work inquiry") do |format|
      format.text
      format.html
    end
  end
end
