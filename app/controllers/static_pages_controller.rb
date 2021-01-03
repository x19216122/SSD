class StaticPagesController < ApplicationController
  def home
  end

  def profile
  end

  def products
  end

  def registration
  end
  
  def createOrder
    @orders = Order.all

  end

  def checkout
  end

  def cart
  end

  def thankyou
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "Paid with Paypal")
  end
end
