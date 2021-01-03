# frozen_string_literal: true

require Rails.root.join("lib/devise/strategies/passwordless_authenticatable")

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :passwordless_authenticatable

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  has_many :notifications, as: :recipient

  protected def password_required?
    false
  end
end
