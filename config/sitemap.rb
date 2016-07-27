Sitemap::Generator.instance.load host: ENV["HOST"] do
  path :root, priority: 1
  literal "/products/search"
  resources :products, only: [:show]
end
