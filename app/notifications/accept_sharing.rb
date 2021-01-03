# frozen_string_literal: true

class AcceptSharing < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "UserMailer", delay: 15.minutes, unless: :read?

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
