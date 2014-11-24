Csa::Application.configure do
  # Actually don't really want to send
  config.action_mailer.delivery_method = :test

  config.action_mailer.smtp_settings = {
       address: "smtphost.aber.ac.uk",
        port: 25
   }
  ADMIN_EMAIL="admin@host.ac.com"
end