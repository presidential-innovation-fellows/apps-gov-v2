class AdminProductDraftMailer < BaseMandrillMailer
  def send_email(admin, product)
    subject = t(".subject")
    merge_vars = {
      "ADMIN_FIRST_NAME" => admin.first_name,
      "PRODUCT_NAME" => product.name
    }
    body = mandrill_template("apps-gov-admin-product-draft", merge_vars)

    send_mail(admin, subject, body)
  end
end
