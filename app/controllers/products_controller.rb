class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def show
    @product = Product.find_by(id: params[:id])
    render template:"products/show"
  end

  # This makes a new product entry when using HTTPie and choosing the POST option"
  # Can verify using the count command or viewing items in rails console ie: Product.count, Product.all
  # def create
  #   @product = Product.new(
  #     item_name: "Newish Item", 
  #     item_price: 15, 
  #     image_url: "https://i.etsystatic.com/13144413/r/il/924cb7/4470118009/il_fullxfull.4470118009_27d8.jpg", 
  #     item_description: "Mon Chichi", 
  #   )
  #   @product.save
  #   render template: "products/show"
  # end

  # This has the user put their inputs to create a new product entry, in this case using HTTPie
  def create
    @product = Product.new(
      item_name: params[:item_name],
      item_price: params[:item_price], 
      image_url: params[:image_url], 
      item_description: params[:item_description], 
    )
    @product.save
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      item_name: params[:item_name] || @product.item_name,
      item_price: params[:item_price] || @product.item_price,
      image_url: params[:image_url] || @product.image_url,
      item_description: params[:item_description] || @product.item_description,
    )
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Product destroyed successfully!" }
  end

end