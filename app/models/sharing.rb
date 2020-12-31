# frozen_string_literal: true

class Sharing < ApplicationRecord
  attr_reader :email

  belongs_to :list
  belongs_to :sharer, class_name: "User"
  belongs_to :recipient, class_name: "User", optional: true

  validate :_recipient_presence, :_email

  scope :pending, -> { where(status_at: nil) }

  def email=(email)
    self.recipient = User.find_by(email: email)
  end

  def accept!
    update!(status_at: Time.current, accepted: true)
  end

  def decline!
    update!(status_at: Time.current, accepted: false)
  end

  private def _email
    return if _email_well_formatted?

    errors.add(:base, "The email format is not valid")
  end

  private def _recipient_presence
    return if !_email_well_formatted? || recipient.present?

    errors.add(:base, "The email address does not belong to a ListIt user")
  end

  private def _email_well_formatted?
    email&.match?(Devise.email_regexp)
  end
end
