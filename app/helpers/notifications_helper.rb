# frozen_string_literal: true

module NotificationsHelper
  def notification_message(notification)
    sharing = notification.params[:sharing]
    case notification.type
    when "NewSharing"
      t("notifications.new_sharing.message", sharer_email: sharing.sharer.email, list_name: sharing.list.name)
    when "AcceptSharing"
      t("notifications.accept_sharing.message", recipient_email: sharing.recipient.email)
    when "DeclineSharing"
      t("notifications.decline_sharing.message", recipient_email: sharing.recipient.email)
    end
  end

  def notification_notifiable(notification)
    notification.params[:sharing]
    # case notification.type
    # when "NewSharing"
    # end
  end
end
