CATEGORY_SEEDS = {
  "Analytics and Data Science" => [
    {
      name: "Analytics and Business Intelligence"
    }, {
      name: "Data Infrastructure"
    }, {
      name: "Data Science"
    }
  ],
  "Customer Support and Success" => [
    {
      name: "Community"
    }, {
      name: "Support"
    }, {
      name: "User Engagement and Feedback"
    }
  ],
  "Developer" => [
    {
      name: "API and Developer Tools"
    }, {
      name: "Databases"
    }, {
      name: "Languages and Frameworks"
    }, {
      name: "Mobile Development"
    }, {
      name: "Software Development"
    }
  ],
  "DevOps and IT" => [
    {
      name: "Application Maintenance and Monitoring"
    }, {
      name: "Content Management System (CMS)"
    }, {
      name: "DevOps"
    }, {
      name: "Hosting"
    }, {
      name: "PaaS, IaaS, and Containers"
    }, {
      name: "Security"
    }, {
      name: "Servers, Networks and Storage"
    }
  ],
  "Finance and Accounting" => [
    {
      name: "Accounting"
    }, {
      name: "Finance"
    }, {
      name: "Payments"
    }
  ],
  "HR" => [
    {
      name: "Hiring"
    }, {
      name: "Workforce Management"
    }
  ],
  "Marketing" => [
    {
      name: "Ad Tech"
    }, {
      name: "Content Marketing"
    }, {
      name: "Demand Generation"
    }, {
      name: "Digital Marketing"
    }, {
      name: "Email Marketing"
    }, {
      name: "Marketing Automation"
    }, {
      name: "Marketing Intelligence"
    }, {
      name: "Mobile Marketing"
    }, {
      name: "SEO and Search Marketing"
    }, {
      name: "Social Media"
    }
  ],
  "Product and Design" => [
    {
      name: "Design"
    }, {
      name: "Product Management"
    }
  ],
  "Productivity and Operations" => [
    {
      name: "BPM and Workflow"
    }, {
      name: "Collaboration"
    }, {
      name: "Communications"
    }, {
      name: "Ecommerce"
    }, {
      name: "Email Hosting and Tools"
    }, {
      name: "Legal"
    }, {
      name: "Operations"
    }, {
      name: "Productivity"
    }, {
      name: "Vertical Software"
    }
  ],
  "Sales and BD" => [
    {
      name: "CRM"
    }, {
      name: "Sales"
    }
  ]
}.freeze

def create_subcategories(category, subcategories)
  subcategories.each do |subcategory|
    category.subcategories.find_or_create_by!(name: subcategory[:name])
  end
end

def destroy_existing_subcategories_for(category)
  category.subcategories.destroy_all
end

def find_or_create_categories(name)
  Category.find_or_create_by!(name: name)
end

ActiveRecord::Base.transaction do
  CATEGORY_SEEDS.each do |name, subcategories|
    find_or_create_categories(name).tap do |category|
      destroy_existing_subcategories_for(category)
      create_subcategories(category, subcategories)
    end
  end
end
