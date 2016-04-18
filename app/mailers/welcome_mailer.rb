class WelcomeMailer < BaseMandrillMailer
  def send_email(user)
    subject = t(".subject")
    merge_vars = {
      "FIRST_NAME" => user.first_name
    }
    body = mandrill_template("apps-gov-welcome", merge_vars)

    send_mail(user, subject, body)
  end
end
