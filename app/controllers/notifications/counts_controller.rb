# frozen_string_literal: true

module Notifications
  class CountsController < ApplicationController
    def show
      @unread_notifications_count = current_user.notifications.unread.count
    end
  end
end
