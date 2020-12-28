# frozen_string_literal: true

json.extract! list, :id, :name, :user_id, :created_at, :updated_at
json.url list_url(list, format: :json)
