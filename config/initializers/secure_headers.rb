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
  config.referrer_policy = "strict-origin-when-cross-origin"

  config.csp = {
    default_src: %w['self'],
    script_src: %w[
      'self'
      'unsafe-inline'
      https://cdn.jsdelivr.net
      https://cdnjs.cloudflare.com
      https://cdn.jsdelivr.net/npm/es-module-shims
    ],
    style_src: %w[
      'self'
      'unsafe-inline'
      https://cdn.jsdelivr.net
      https://fonts.googleapis.com
    ],
    font_src: %w[
      'self'
      data:
      https://fonts.gstatic.com
    ],
    img_src: %w[
      'self'
      data:
    ],
    connect_src: %w[
      'self'
      https://cdn.jsdelivr.net
    ]
  }
end
