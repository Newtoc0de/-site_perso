class ContactMailer < ApplicationMailer
  def contact_email
    mail(to: ENV.fetch["CONTACT_EMAIL"], subject: "Formulaire de contact")
  end
end
