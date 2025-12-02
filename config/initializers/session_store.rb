Rails.application.config.session_store :cookie_store,
  key: '_quiz_app_session',
  secure: Rails.env.production?,   # only send over HTTPS in production
  httponly: true,                  # JS can’t read the cookie
  same_site: :lax                  # better CSRF protection
  
