class ItemsController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create, :edit]
  
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def create 
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  

  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_explain, :category_id, :item_condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_lead_time_id, :price, :image).merge(user_id: current_user.id)
  end

end
