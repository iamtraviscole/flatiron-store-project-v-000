class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      @cart = current_user.current_cart
    else
      current_user.current_cart = Cart.create
      @cart = current_user.current_cart
    end

    line_item = @cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(@cart)
    else
      redirect_to store_path
    end
  end

end
