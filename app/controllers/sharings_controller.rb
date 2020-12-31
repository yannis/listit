# frozen_string_literal: true

class SharingsController < ApplicationController
  load_and_authorize_resource :list
  load_and_authorize_resource :sharing, through: :list, param_method: :_sharing_params

  def new; end

  def create
    if @sharing.save
      redirect_to @list, notice: "Invitation sent"
    else
      render "new"
    end
  end

  def destroy
  end

  private def _sharing_params
    params.require(:sharing).permit(:email)
  end
end
