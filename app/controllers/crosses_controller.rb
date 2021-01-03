# frozen_string_literal: true

class CrossesController < ApplicationController
  include ActionView::RecordIdentifier

  load_and_authorize_resource :list
  load_and_authorize_resource :item, through: :list

  def create
    @item.cross!
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       dom_id(@list, :items),
    #       partial: "lists/items",
    #       locals: { list: @list }
    #     )
    #   end
    # end
  end

  def destroy
    @item.uncross!
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace(
    #       dom_id(@list, :items),
    #       partial: "lists/items",
    #       locals: { list: @list }
    #     )
    #   end
    # end
  end
end
