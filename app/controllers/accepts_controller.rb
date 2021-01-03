# frozen_string_literal: true

class AcceptsController < ApplicationController
  include ActionView::RecordIdentifier

  load_and_authorize_resource :sharing

  def create
    if @sharing.accept!
      redirect_to @sharing.list, notice: "List shared"
      AcceptSharing.with(sharing: @sharing, sharing_id: @sharing.id).deliver_later(@sharing.sharer)
    else
      redirect_to @sharing, error: "Unable to share list"
    end
  end

  def destroy
    if @sharing.decline!
      redirect_to root_path, notice: "Invitation declined"
      DeclineSharing.with(sharing: @sharing, sharing_id: @sharing.id).deliver_later(@sharing.sharer)
    else
      redirect_to @sharing, error: "Unable to decline invitation"
    end
  end
end
