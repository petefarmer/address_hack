class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = if params[:search].present?
      Item.where('"items"."item_key" ILIKE :search OR description ILIKE :search OR 
                 item_type ILIKE :search OR item_subtype ILIKE :search OR 
                 "items"."upc_key" ILIKE :search OR manufacturer_code ILIKE :search',
                 search: "%#{params[:search]}%")
    else
      Item.all
    end

    # Apply sorting
    sort_column = %w[item_key description upc_key item_type].include?(params[:sort]) ? params[:sort] : "item_key"
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    
    @items = @items.order("#{sort_column} #{sort_direction}")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully deleted.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :item_key, :description, :upc_key,
      :item_type, :item_subtype, :order_method,
      :price_group, :product_key, :commodity_key,
      :abc_key, :eccn_code, :physical_count_days,
      :manufacturer_code,
      :stock_unit, :minimum_stock,
      :serial_tracked, :lot_tracked,
      :purchasable, :saleable,
      :purchase_unit, :sales_unit, :production_unit,
      :track_serial_lot, :auto_lot_issue_method,
      :default_lot_size, :storage_condition
    )
  end
end
