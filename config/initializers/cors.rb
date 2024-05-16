Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # changed origins to point to website
    # origins "*"
    origins "mini-capstone.peterxjang.com"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end