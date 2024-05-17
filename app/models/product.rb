class Product < ApplicationRecord

  def is_discounted?
    # p id
    if item_price <= 10
      return true
    else
      return false
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
    return tax.round(2) 
  end

  # why was this broken?
  # def total_result
  #   return total
  #   total = item_price + tax_result
  # end

  def total_result
    total = item_price + tax_result
    return total
  end
  
end
