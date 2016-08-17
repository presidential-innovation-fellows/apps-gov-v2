# Be sure to restart your server when you modify this file.

Rails.application.config.session_store \
  :cookie_store,
  key: "_apps-gov-v2_session",
  secure: Rails.env.production?
