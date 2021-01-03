# frozen_string_literal: true

class SharingMailer < ApplicationMailer
  def new
    @sharing = params[:sharing]
    @sharer = @sharing.sharer
    @recipient = @sharing.recipient
    @url = sharing_url(params[:sharing])
    mail(to: @recipient.email, subject: t("notifications.new_sharing.email.subject"))
  end

  def accept
    @sharing = params[:sharing]
    @sharer = @sharing.sharer
    @recipient = @sharing.recipient
    @url = sharing_url(params[:sharing])
    mail(to: @recipient.email, subject: t("notifications.accept_sharing.email.subject"))
  end

  def decline
    @sharing = params[:sharing]
    @sharer = @sharing.sharer
    @recipient = @sharing.recipient
    @url = sharing_url(params[:sharing])
    mail(to: @recipient.email, subject: t("notifications.decline_sharing.email.subject"))
  end
end
