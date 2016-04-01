Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

Dir["db/product-seeds/*.json"].each do |product_json_file|
  file = File.read("#{product_json_file}")
  product_hash = JSON.parse(file)

  product = Product.new
  product.attributes = product_hash.reject { |k, _v| !product.attributes.keys.member?(k.to_s) }
  puts product_hash["slug"]
  product.save!

  if product_hash["contracts"]
    product_hash["contracts"].each do |contract_slug|
      contract = Contract.find_by(slug: contract_slug)
      ProductContract.create!(contract: contract, product: product)
    end
  end

  if product_hash["top_keywords"]
    product_hash["top_keywords"].each do |keyword_name|
      keyword = Keyword.find_or_create_by!(name: keyword_name)
      ProductKeyword.create!(keyword: keyword, product: product)
    end
  end

  if product_hash["gov_customers"]
    product_hash["gov_customers"].each do |agency_code|
      agency = Agency.find_by(code: agency_code)
      Customer.create!(agency: agency, product: product)
    end
  end
end
