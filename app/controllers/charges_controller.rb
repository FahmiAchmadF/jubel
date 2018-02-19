class ChargesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: false
  before_action :set_product, except: []
  
  def new
  end

  def create
    # Amount in cents
    @amount = (@product.price * 100).round

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @product.name,
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def set_product
      @product = Product.find_by(id: params[:id]) or not_found
    end
end
