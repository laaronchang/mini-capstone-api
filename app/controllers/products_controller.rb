class ProductsController < ApplicationController
  
  def all
    @products = Product.all
    render template: "products/index"
  end
  
  def show
    @product = Product.find_by(id:3)
    render template:"product/show"

  end

end
