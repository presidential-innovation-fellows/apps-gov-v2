class ProductRequestMailer < BaseMandrillMailer
  def send_email(product, user)
    subject = t(".subject")
    merge_vars = {
      "FIRST_NAME" => user.first_name,
      "PRODUCT_NAME" => product.name
    }
    body = mandrill_template("apps-gov-product-request", merge_vars)

    send_mail(user, subject, body)
  end
end
