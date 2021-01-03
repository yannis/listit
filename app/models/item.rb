# frozen_string_literal: true

class Item < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :list

  validates :name, presence: true

  after_commit :_touch_list_last_used_at, :_stream_to_list

  scope :ordered_for_list, -> { order(crossed_at: :desc, created_at: :desc) }

  def crossed?
    crossed_at
  end

  def cross!
    update(crossed_at: Time.current)
  end

  def uncross!
    update(crossed_at: nil)
  end

  private def _touch_list_last_used_at
    list.touch_last_used_at
  end

  private def _stream_to_list
    broadcast_replace_to(list, :items, target: dom_id(list, :items), partial: "lists/items", locals: { list: list, items: list.items.ordered_for_list })
  end
end
