# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :sharings, dependent: :destroy

  after_save :touch_last_used_at

  # after_create_commit {
  #   broadcast_prepend_to(:lists)
  # }
  # after_update_commit ->(list) {
  #   # broadcast_replace_to(:lists)
  #   broadcast_replace_to(list, :items, template: "lists/items", locals: { list: list })
  # }
  # after_destroy_commit ->(list) {
  #   # broadcast_remove_to(:lists)
  #   broadcast_replace_to(list)
  # }

  def touch_last_used_at
    touch(:last_used_at)
  end
end
