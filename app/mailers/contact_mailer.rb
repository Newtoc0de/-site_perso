class ContactMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def contact_email(contact)
    @contact = contact
    mail(to: ENV.fetch("CONTACT_EMAIL"), subject: "Formulaire de contact")
  end
end
