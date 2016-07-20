class RejectionMailer < BaseMandrillMailer
  def send_email(message, product, user)
    subject = t(".subject")
    merge_vars = {
      "FIRST_NAME" => user.first_name,
      "MESSAGE" => message.content,
      "PRODUCT_NAME" => product.name
    }
    body = mandrill_template("apps-gov-rejection", merge_vars)

    send_mail(user, subject, body)
  end
end
