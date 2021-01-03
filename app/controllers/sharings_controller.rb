# frozen_string_literal: true

class SharingsController < ApplicationController
  load_and_authorize_resource :list, except: :show
  load_and_authorize_resource :sharing, through: :list, shallow: true, param_method: :_sharing_params

  after_action :_read_notification, only: :show

  def show; end

  def new; end

  def create
    if @sharing.save
      respond_to do |format|
        format.html { redirect_to @sharing, target: "", notice: "Invitation sent" }
      end
      NewSharing.with(sharing: @sharing, sharing_id: @sharing.id).deliver_later(@sharing.recipient)
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            @sharing,
            partial: "sharings/form",
            locals: { sharing: @sharing }
          )
        }
        format.html { render "new" }
      end
    end
  end

  def destroy
  end

  private def _sharing_params
    params.require(:sharing).permit(:email)
  end

  private def _read_notification
    current_user.notifications.unread.where("params->'sharing' = ?", Noticed::Coder.dump(@sharing).to_json).mark_as_read!
  end
end
