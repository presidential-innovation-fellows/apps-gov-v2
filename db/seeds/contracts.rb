contracts = [
  {
    description: "Lorem ipsum.",
    name: "NASA Solutions for Enterprise Wide Procurement (SEWP)",
    slug: "sewp"
  }, {
    description: "Lorem ipsum.",
    name: "Micro-Purchase Threshold",
    slug: "micro"
  }, {
    description: "Lorem ipsum.",
    name: "NIH Information Technology Acquisition and Assessment Center",
    slug: "nitaac"
  }, {
    description: "Lorem ipsum.",
    name: "Schedule 70",
    slug: "s70"
  }
]

ActiveRecord::Base.transaction do
  contracts.each do |contract|
    Contract.create!(contract)
  end
end
