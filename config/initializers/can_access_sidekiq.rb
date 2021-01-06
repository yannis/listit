# frozen_string_literal: true

class CanAccessSidekiq
  def self.matches?(request)
    current_user = request.env["warden"].user
    Ability.new(current_user).can?(:manage, Sidekiq)
  end
end
