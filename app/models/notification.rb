# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model
  include ActionView::RecordIdentifier
  belongs_to :recipient, polymorphic: true

  after_commit :stream_to_recipient_navigation_badge
  after_create_commit ->(notification) { broadcast_prepend_to(notification.recipient, :notifications) }
  after_update_commit ->(notification) { broadcast_replace_to(notification.recipient, :notifications) }
  after_destroy_commit ->(notification) { broadcast_remove_to(notification.recipient, :notifications) }

  def stream_to_recipient_navigation_badge
    broadcast_replace_to(recipient, :notifications_count, target: dom_id(recipient, :notifications_count), partial: "notifications/counts/count", locals: { unread_notifications_count: recipient.notifications.unread.count, current_user: recipient })
  end
end
