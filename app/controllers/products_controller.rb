class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def show
    @product = Product.find_by(id: params[:id])
    render template:"products/show"
  end

  def create
    @product = Product.new(
      item_name: "Newish Item", 
      item_price: 15, 
      image_url: "https://i.etsystatic.com/13144413/r/il/924cb7/4470118009/il_fullxfull.4470118009_27d8.jpg", 
      item_description: "Mon Chichi", 
    )
    @product.save
    render template: "products/show"
  end
end
