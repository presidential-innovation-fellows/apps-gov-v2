contracts = [
  {
    name: "NASA Solutions for Enterprise Wide Procurement (SEWP)",
    slug: "sewp"
  }, {
    name: "Micro-Purchase Threshold",
    slug: "micro"
  }, {
    name: "NIH Information Technology Acquisition and Assessment Center",
    slug: "nitaac"
  }, {
    name: "Schedule 70",
    slug: "s70"
  }
]

ActiveRecord::Base.transaction do
  contracts.each do |contract|
    Contract.create!(contract)
  end
end
