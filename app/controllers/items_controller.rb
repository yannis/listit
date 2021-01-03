# frozen_string_literal: true

class ItemsController < ApplicationController
  load_and_authorize_resource :list
  load_and_authorize_resource :item, through: :list, param_method: :_item_params

  def index
    @items = @items.ordered_for_list
  end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if @item.save
        format.html { redirect_to list_path(@list), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: list_item_path(@list, @item) }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            @item,
            partial: "items/form",
            locals: { item: @item }
          )
        }
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_item_path(@list, @item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: list_item_path(@list, @item) }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@list), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private def item_params
    params.require(:item).permit(:name, :crossed_at, :list_id)
  end
end
