class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    binding.pry
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
    
  end



end
