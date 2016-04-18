require "mandrill"

class BaseMandrillMailer < ActionMailer::Base
  default(
    from: ENV.fetch("MAILER_FROM_EMAIL")
  )

  private

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end

  def send_mail(user, subject, body)
    mail(
      to: user.email,
      subject: subject,
      body: body,
      content_type: "text/html"
    )
  end
end
