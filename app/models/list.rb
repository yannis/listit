# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  after_save :touch_last_used_at

  after_update_commit { broadcast_replace_to(:lists) }
  after_destroy_commit { broadcast_remove_to(:lists) }

  def touch_last_used_at
    touch(:last_used_at)
  end
end
