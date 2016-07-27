module MailchimpHelper
  def mailchimp_newsletter_url
    "//#{base_url}/subscribe/post?u=8ff93f9a5662324b360f8107e&id=0ec80d1a39"
  end

  private

  def base_url
    "presidentialinnovationfellows.us11.list-manage.com"
  end
end
