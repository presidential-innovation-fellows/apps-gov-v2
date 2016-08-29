contracts = [
  {
    contact_email: "help@sewp.nasa.gov",
    description: '<p><a href="http://www.sewp.nasa.gov/" target="blank">NASA Solutions for Enterprise Wide Procurement (SEWP)</a> is a multi-award Government-wide Acquisition Contract focused on commercial Information Technology (IT) products and product-based services. There are 147 pre-competed Contract Holders, many of them small businesses, which serve as resellers of these IT technologies and product-based services.</p>',
    name: "NASA Solutions for Enterprise Wide Procurement (SEWP)",
    slug: "sewp",
    steps: '<p>If new to NASA SEWP then please follow the steps below to acquire guidance to create quotes for purchasing using the NASA SEWP contract vehicle:</p><ul class="contract-steps"><li>Send an email to <a href="mailto:help@sewp.nasa.gov" target="blank">help@sewp.nasa.gov</a> titled ‘Apps.Gov RFQ request’ to include your name, email, agency, contracting officer info (if required), and the product description.</li><li>A member of the SEWP Customer Care team will contact you within one business day to assist you with creating your RFQ using the <a href="https://www.sewp.nasa.gov/sewp5public/security/login.sa" target="blank">SEWP Quote Request Tool (QRT)</a>.</li><li>Upon receipt of an RFQ, the NASA SEWP Contract Holders will add the provider and selected products to their catalog. Reponses to your RFQ can be expected within a few days. At that point, the Contracting Officer will be able to purchase the product.</li></ul>'
  }, {
    description: "<p>If a product costs less than $3,500 / year you can use a purchase card to procure the product. If the annual cost exceeds that amount, you'll need to use another procurement option.</p>",
    name: "Micro-Purchase Threshold",
    slug: "micro",
    steps: ""
  }, {
    description: '<p>The National Institute of Health (NIH) <a href="https://nitaac.nih.gov/nitaac/" target="_blank">NIH Information Technology Acquisition and Assessment Center</a> is an Office of Management and Budget (OMB) GWAC for IT procurement, which consists of: CIO-SP3, CIO-SP3 Small Business and CIO-CS.</p>',
    name: "NIH Information Technology Acquisition and Assessment Center",
    slug: "nitaac",
    steps: '<p>If you have questions, please reach out to the NITAAC team via <a href="mailto:NITAACsupport@nih.gov">NITAACsupport@nih.gov.</a></p><ul><li>Some steps that are required to purchase a product off this GWAC.</li></ul>'
  }, {
    contact_email: "ITSchedule70@gsa.gov",
    description: '<p>The General Services Administration’s (GSA) IT Schedule 70 is an indefinite delivery/indefinite quantity (IDIQ) multiple award schedule that allows federal, state, local and tribal government entities to procure technology products and services from more than 5,000 pre-vetted vendors--many of which are small businesses.</p><p>Agencies that use IT Schedule 70 benefit from:</p><ul class="contract-info"><li>Competitive prices and discounts- GSA negotiates its fair and reasonable prices based on the aggregated buying power of the federal government.</li><li>Flexible contracting and streamlined ordering- IT Schedule 70 saves you time by delivering combined synopses and solicitations, as well as making it easier for you to meet Competition in Contracting Act (CICA) requirements. Schedules accept purchase cards and allow task orders and blanket purchase agreements (BPAs).</li><li>Value-added services - A team of business management specialists, technical analysts, and contracting officers work closely with customer agencies to ensure best value, technical accuracy, and compliance with the Federal Acquisition Regulation (FAR) Part 8.4 for all procurements. Customers can request Statement of Work and technical requirements reviews.</li></ul>',
    name: "GSA IT Schedule 70",
    slug: "s70",
    steps: '<p>Customer agencies that use IT Schedule 70 can purchase directly through <a href="https://www.gsaadvantage.gov/advantage/main/start_page.do" target="blank">GSA Advantage!</a>, submit an RFI or RFQ through GSA’s <a href="https://www.gsaadvantage.gov/advantage/login/eBuyLogin.do" target="blank">eBuy</a>, or conduct market research prior to making a purchase by using GSA’s <a href="http://www.gsa.gov/portal/content/100020" target="blank">eLibrary</a>. The steps for procuring technology products or services through IT Schedule 70 varies based on the dollar amount, in accordance with FAR Part 8.4.</p><p>For more information or for assistance making a purchase, email <a href="mailto:itschedule70@gsa.gov" target="blank">ITSchedule70@gsa.gov</a>. Or, visit the <a href="http://www.gsa.gov/portal/category/100515" target="blank">IT Schedule 70</a> website to learn more about available products and services.</p>'
  }
]

ActiveRecord::Base.transaction do
  contracts.each do |contract|
    Contract.find_or_create_by!(contract)
  end
end
