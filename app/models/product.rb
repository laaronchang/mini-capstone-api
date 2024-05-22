class Product < ApplicationRecord
  # validates :item_name, presence: true

  def is_discounted?
    p id
    if item_price <= 10
      p true
    else
      p false
    end
  end

  # Don't know why this did not work
  # def tax_result
  #   p tax_total
  #   tax_total = item_price * 0.09
  # end

  def tax_result 
    tax_rate = 0.09
    tax = item_price * tax_rate
    p tax.round(2) 
  end

  # why was this broken?
  # def total_result
  #   return total
  #   total = item_price + tax_result
  # end

  def total_result
    total = item_price + tax_result
    p total
  end
  
  belongs_to :supplier

end
