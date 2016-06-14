Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

Dir["db/product-seeds/*.json"].each do |product_json_file|
  file = File.read("#{product_json_file}")
  product_hash = JSON.parse(file)

  product = Product.new
  product.attributes = product_hash.reject { |k, _v| !product.attributes.keys.member?(k.to_s) }

  if product_hash["logo_url"]
    product.logo = File.new("#{Rails.root}/db/product-seeds/logos/#{product_hash['logo_url']}")
  end

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

  if product_hash["ato_agency"]
    ato_type = AtoType.find_by(slug: "agency-approval")
    AtoStatus.create!(ato_type: ato_type, product: product)
  end

  if product_hash["fedramp_agency"]
    ato_type = AtoType.find_by(slug: "fedramp-agency")
    AtoStatus.create!(
      ato_type: ato_type,
      product: product,
      url: product_hash["fedramp_agency"]
    )
  end

  if product_hash["fedramp_inprocess_agency"]
    ato_type = AtoType.find_by(slug: "fedramp-agency")
    AtoStatus.create!(
      ato_type: ato_type,
      pending: true,
      product: product,
      url: product_hash["fedramp_inprocess_agency"]
    )
  end

  if product_hash["fedramp_jab"]
    ato_type = AtoType.find_by(slug: "fedramp-jab")
    AtoStatus.create!(
      ato_type: ato_type,
      product: product,
      url: product_hash["fedramp_jab"]
    )
  end
end
