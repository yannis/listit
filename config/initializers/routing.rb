# frozen_string_literal: true

Rails.application.routes.default_url_options = {
  host: ENV["HOST"],
  protocol: Rails.application.config.force_ssl ? "https" : "http"
}
