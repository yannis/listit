# frozen_string_literal: true

module ListsHelper
  def list_details(list)
    details = ["Last updated #{l(list.last_used_at, format: :short)}"]
    unless list.user == current_user
      details << list.user.email
    end
    details.join(" • ")
  end
end
