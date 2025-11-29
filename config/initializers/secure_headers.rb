SecureHeaders::Configuration.default do |config|
  config.cookies = {
    secure: true,
    httponly: true,
    samesite: {
      lax: true
    }
  }

  config.x_frame_options = "DENY"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
  config.x_permitted_cross_domain_policies = "none"

  config.referrer_policy = "strict-origin-when-cross-origin"

  # Content Security Policy
  config.csp = {
  default_src: %w['self'],
  script_src: %w['self' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com],
  style_src: %w['self' 'unsafe-inline' https://cdn.jsdelivr.net https://fonts.googleapis.com],
  font_src: %w['self' data: https://fonts.gstatic.com],
  img_src: %w['self' data:],
  }

end
