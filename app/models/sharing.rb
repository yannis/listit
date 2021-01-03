# frozen_string_literal: true

class Sharing < ApplicationRecord
  attr_accessor :email

  belongs_to :list
  belongs_to :sharer, class_name: "User"
  belongs_to :recipient, class_name: "User", optional: true

  validates :recipient_id, uniqueness: { scope: %i[list_id accepted] }
  validate :_recipient_presence

  before_validation :_set_recipient

  scope :pending, -> { where(status_at: nil) }

  def accept!
    update!(status_at: Time.current, accepted: true)
  end

  def decline!
    update!(status_at: Time.current, accepted: false)
  end

  private def _set_recipient
    return if recipient || (!_email_well_formatted? && errors.add(:base, "The email format is not valid"))

    self.recipient = User.find_by(email: email)
  end

  private def _recipient_presence
    return if email.blank? || !_email_well_formatted? || recipient.present?

    errors.add(:base, "The email address does not belong to a ListIt user")
  end

  private def _email_well_formatted?
    return true if email.blank?

    email&.match?(Devise.email_regexp)
  end
end
