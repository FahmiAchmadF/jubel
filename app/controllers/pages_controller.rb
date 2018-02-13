class PagesController < ApplicationController

  def index
    @products = Product.all
  end

  def search
    @global_search_param = params[:gsearch]
    @products = Product.search_products(@global_search_param)
    render 'index'
  end

  def show
    @product = Product.find_by(id: params[:id]) or not_found
  end
end
