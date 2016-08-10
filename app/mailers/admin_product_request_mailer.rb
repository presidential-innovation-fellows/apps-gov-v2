class AdminProductRequestMailer < BaseMandrillMailer
  def send_email(admin, product, user)
    subject = t(".subject")
    merge_vars = {
      "ADMIN_FIRST_NAME" => admin.first_name,
      "USER_NAME" => user.name,
      "PRODUCT_NAME" => product.name
    }
    body = mandrill_template("apps-gov-admin-product-request", merge_vars)

    send_mail(admin, subject, body)
  end
end
