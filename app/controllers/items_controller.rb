class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      Rails.logger.debug(@item.errors.full_messages)
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_explain, :category_id, :item_condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_lead_time_id, :price, :image).merge(user_id: current_user.id)
  end

end
