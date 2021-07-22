if ENV['APP_ENV'] == 'production'
    mail_options = [
      :smtp,
      {
        address:   "smtp.gmail.com",
        port:      587,
        domain:    "example.com",
        user_name: ENV["SMTP_USER_NAME"],
        password:  ENV["SMTP_PASSWORD"]
      }
    ]
elsif ENV['APP_ENV'] == 'development'
  mail_options = [:smtp, { address: "127.0.0.1", port: 1025 }]
end

Mail.defaults do
  delivery_method(*mail_options)
end
