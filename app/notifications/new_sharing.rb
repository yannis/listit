# frozen_string_literal: true

# To deliver this notification:
#
# SharingNotification.with(sharing: @sharing).deliver_later(current_user)
# SharingNotification.with(sharing: @sharing).deliver(current_user)

class NewSharing < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "SharingMailer", method: :new, delay: 10.minutes, unless: :read?
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # after_database :_stream_to_recipient

  # Add required params
  #
  param :sharing, :sharing_id

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end

  def url
    sharing_path(params[:sharing])
  end
end
