require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  # test "create" do
  #   assert_difference "Product.count", 1 do
  #     post "/products.json", params: { name: "test product", price: 1, image_url: "image.jpg", description: "test description"  }
  #   end
  # end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { item_price: 1, item_name: "test product", item_description: "test description", image_url: "image.jpg"  }
      data = JSON.parse(response.body)
      assert_response 200
      refute_nil data["id"]
      assert_equal "test product", data["name"]
      assert_equal 1, data["price"]
      assert_equal "image.jpg", data["image_url"]
      assert_equal "test description", data["description"]
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "item_name", "item_price", "image_url", "item_description", "created_at", "updated_at"], data.keys
  end

  # test "update" do
  #   product = Product.first
  #   patch "/products/#{product.id}.json", params: { item_name: "Updated item_name" }
  #   assert_response 200

  #   data = JSON.parse(response.body)
  #   assert_equal "Updated name", data["item_name"]
  # end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.item_price, data["price"]
    assert_equal product.image_url, data["image_url"]
    assert_equal product.item_description, data["description"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
