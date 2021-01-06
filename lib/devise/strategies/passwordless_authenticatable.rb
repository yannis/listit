# frozen_string_literal: true

require "devise/strategies/authenticatable"
require_relative "../../../app/mailers/user_mailer"
module Devise
  module Strategies
    class PasswordlessAuthenticatable < Authenticatable
      def authenticate!
        return if params[:user].blank?

        user = User.find_by(email: params[:user][:email])
        if user&.update(login_token: SecureRandom.hex(10),
                        login_token_valid_until: Time.current + 60.minutes)
          # url = Rails.application.routes.url_helpers.email_confirmation_url(login_token: user.login_token)
          url = Rails.application.routes.url_helpers.sign_in_with_token_url(login_token: user.login_token)
          UserMailer.validate_email(user, url).deliver_now
        end
        fail!("If we found your address, an email was sent to you with a magic link.")
      end
    end
  end
end

Warden::Strategies.add(:passwordless_authenticatable, Devise::Strategies::PasswordlessAuthenticatable)
