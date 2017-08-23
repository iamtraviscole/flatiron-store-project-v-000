class CartsController < ApplicationController

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end

end
