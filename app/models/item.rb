# frozen_string_literal: true

class Item < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :list

  validates :name, presence: true

  after_save :_touch_list_last_used_at

  after_create_commit ->(item) { broadcast_prepend_to(item.list, :items) }
  after_update_commit ->(item) { broadcast_replace_to(item.list, :items) }
  after_destroy_commit ->(item) { broadcast_remove_to(item.list, :items) }

  private def _touch_list_last_used_at
    list.touch_last_used_at
  end
end
